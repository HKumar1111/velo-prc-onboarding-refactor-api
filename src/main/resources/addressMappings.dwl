[
      ({
        "Type": "PrimaryAddress",
        "IsForeignAddress": if(vars.applicationObjectData.TF4SF__Country__c == "China")
        						true
        					else
        						false,
        "StreetAddress1": vars.applicationObjectData.TF4SF__Street_Address_1__c default "",
        "StreetAddress2": vars.applicationObjectData.TF4SF__Street_Address_2__c default "",
        "StreetAddress3": vars.applicationObjectData.Street_Address_3__c default "",
        "City": vars.applicationObjectData.TF4SF__City__c default "",
        "State": vars.applicationObjectData.TF4SF__State__c default "",
        "Zip": vars.applicationObjectData.TF4SF__Zip_Code__c default "",
        "CountryCode": if(vars.applicationObjectData.TF4SF__Country__c == "United States of America" or vars.applicationObjectData.TF4SF__Country__c == "United States")
        				"USA"
        				else if (vars.applicationObjectData.TF4SF__Country__c == "China")
        				"CHN"
        				else null,
		"Country": vars.applicationObjectData.TF4SF__Country__c default ""
      }) if ( (vars.applicationObjectData.TF4SF__Street_Address_1__c != null) or (vars.applicationObjectData.TF4SF__Street_Address_2__c != null) or (vars.applicationObjectData.Street_Address_3__c != null) or (vars.applicationObjectData.TF4SF__City__c != null) or (vars.applicationObjectData.TF4SF__State__c != null) or (vars.applicationObjectData.TF4SF__Zip_Code__c != null) ),
      ({
        "Type": "MailingAddress",
        "IsForeignAddress": if(vars.applicationObjectData.Mailing_Country_NRA__c == "China")
        						true
        					else
        						false,
        "StreetAddress1": vars.applicationObjectData.TF4SF__Mailing_Street_Address_1__c default "",
        "StreetAddress2": vars.applicationObjectData.TF4SF__Mailing_Street_Address_2__c default "",
        "StreetAddress3": vars.applicationObjectData.Mailing_Street_Address_3__c default "",
        "City": vars.applicationObjectData.TF4SF__Mailing_City__c default "",
        "State": vars.applicationObjectData.TF4SF__Mailing_State__c default "",
        "Zip": vars.applicationObjectData.TF4SF__Mailing_Zip_Code__c default "",
        "Country": vars.applicationObjectData.Mailing_Country_NRA__c default "",
        "CountryCode": if(vars.applicationObjectData.Mailing_Country_NRA__c == "China") "CHN"
        				else if (vars.applicationObjectData.Mailing_Country_NRA__c == "United States of America" or vars.applicationObjectData.Mailing_Country_NRA__c == "United States") "USA"
        				else null
      }) if ( (vars.applicationObjectData.TF4SF__Mailing_Street_Address_1__c != null) or (vars.applicationObjectData.TF4SF__Mailing_Street_Address_2__c != null) or (vars.applicationObjectData.Mailing_Street_Address_3__c != null) or (vars.applicationObjectData.TF4SF__Mailing_City__c != null) or (vars.applicationObjectData.TF4SF__Mailing_State__c != null) or (vars.applicationObjectData.TF4SF__Mailing_Zip_Code__c != null)  ),
      ({
        "Type": "PrimaryChineseAddress",
        "IsForeignAddress": if(vars.additinalInfoObjectData.Mailing_Country_Code__c == "China")
        						true
        					else
        						false,
        "StreetAddress1": vars.additinalInfoObjectData.StreetAddress_1__c default "",
        "StreetAddress2": vars.additinalInfoObjectData.StreetAddress_2__c default "",
        "StreetAddress3": vars.additinalInfoObjectData.StreetAddress_3__c default "",
        "City": vars.additinalInfoObjectData.City__c default "",
        "State": vars.additinalInfoObjectData.State__c default "",
        "Zip": vars.additinalInfoObjectData.Zip__c default "",
        "CountryCode": vars.additinalInfoObjectData.Country_Code__c,
		"Country": vars.additinalInfoObjectData.Country__c default ""
      }) if ( (vars.additinalInfoObjectData.StreetAddress_1__c != null) or (vars.additinalInfoObjectData.StreetAddress_2__c != null) or (vars.additinalInfoObjectData.StreetAddress_3__c != null) or (vars.additinalInfoObjectData.City__c != null) or (vars.additinalInfoObjectData.State__c != null) or (vars.additinalInfoObjectData.Zip__c != null) ),
      ({
        "Type": "MailingChineseAddress",
        "IsForeignAddress": if(vars.additinalInfoObjectData.Mailing_Country_Code__c == "China")
        						true
        					else
        						false,
        "StreetAddress1": vars.additinalInfoObjectData.Mailing_Street_Address_1__c default "",
        "StreetAddress2": vars.additinalInfoObjectData.Mailing_Street_Address_2__c default "",
        "StreetAddress3": vars.additinalInfoObjectData.Mailing_Street_Address_3__c default "",
        "City": vars.additinalInfoObjectData.Mailing_City__c default "",
        "State": vars.additinalInfoObjectData.Mailing_State__c default "",
        "Zip": vars.additinalInfoObjectData.Mailing_Zip_Code__c default "",
        "CountryCode": vars.additinalInfoObjectData.Mailing_Country_Code__c,
		"Country": vars.additinalInfoObjectData.Mailing_Country__c default ""
      }) if ( (vars.additinalInfoObjectData.Mailing_Street_Address_1__c != null) or (vars.additinalInfoObjectData.Mailing_Street_Address_2__c != null) or (vars.additinalInfoObjectData.Mailing_Street_Address_3__c != null) or (vars.additinalInfoObjectData.Mailing_City__c != null) or (vars.additinalInfoObjectData.Mailing_State__c != null) or (vars.additinalInfoObjectData.Mailing_Zip_Code__c != null) )
    ]   