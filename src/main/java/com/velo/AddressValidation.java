package com.velo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

public class AddressValidation {

	public static ArrayList validation(LinkedHashMap payload) {

		// Initialization of customer, addresses errorList object
		LinkedHashMap customer = new LinkedHashMap();
		ArrayList<LinkedHashMap> addresses = new ArrayList<LinkedHashMap>();
		ArrayList addressErrorList = new ArrayList();
		boolean isprimaryAddressCHN = false;
		boolean ismailingAddressValidUS = true;
		boolean ismailingAddressValidCHN = true;

		// Fetching Customer details from payload
		customer = (LinkedHashMap) payload.get("Customer");

		// Fetching Addresses from Customer
		addresses = (ArrayList<LinkedHashMap>) customer.get("Addresses");

		// Iterating addresses and checking condition(Primary address should be Chinese)
		for (LinkedHashMap address : addresses) {
			if ((address.get("Type").toString().contentEquals("PrimaryAddress"))
					& (address.get("CountryCode").toString().contentEquals("CHN"))) {

				isprimaryAddressCHN = true;
				break;
			}

		}

		// Iterating addresses and checking condition(MailingAddress(US) should be in
		// required format )
		for (LinkedHashMap address : addresses) {
			if (address.get("Type").toString().contentEquals("MailingAddress")
					& (address.get("CountryCode").toString().contentEquals("USA"))) {

				Set fields = address.keySet();
				Set<String> mandatoryFields = new HashSet<String>();
				mandatoryFields.add("City");
				mandatoryFields.add("State");
				mandatoryFields.add("Zip");

				if (fields.containsAll(mandatoryFields)) {

				} else {
					ismailingAddressValidUS = false;
					break;
				}

			}

		}

		// Iterating addresses and checking condition(MailingAddress(CHN) should be in
		// required format )
		for (LinkedHashMap address : addresses) {
			if (address.get("Type").toString().contentEquals("MailingAddress")
					& (address.get("CountryCode").toString().contentEquals("CHN"))) {

				Set fields = address.keySet();
				Set<String> mandatoryFields = new HashSet<String>();
				mandatoryFields.add("StreetAddress1");
				mandatoryFields.add("Country");
				mandatoryFields.add("CountryCode");

				if (fields.containsAll(mandatoryFields)) {

				} else {
					ismailingAddressValidCHN = false;
					break;
				}

			}

		}

		// setting errorList object if condition fails
		if (isprimaryAddressCHN) {
		} else {
			addReason(600, "Primary Address is not valid", addressErrorList);
		}

		if (ismailingAddressValidUS) {
		} else {
			addReason(601, "Mailing address(USA) is not in required format,should have City,State and Zip ", addressErrorList);
		}

		if (ismailingAddressValidCHN) {
		} else {
			addReason(602,
					"Mailing address(CHN) is not in required format,should have StreetAddress1, Country and CountryCode  ",
					addressErrorList);
		}

		return addressErrorList;

	}

	static void addReason(int code, String desc, ArrayList errorList) {
		HashMap error = new HashMap();
		error.put("ResponseCode", code);
		error.put("ResponseDescription", desc);
		errorList.add(error);
	}

}
