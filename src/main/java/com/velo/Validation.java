package com.velo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.everit.json.schema.Schema;
import org.everit.json.schema.ValidationException;
import org.everit.json.schema.loader.SchemaLoader;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

public class Validation {

	public static ArrayList validate(LinkedHashMap fileContentmap, String schemaFileName) {

		ArrayList errorList = new ArrayList();
		try {

			JSONObject jsonSchema = new JSONObject(
					new JSONTokener(Validation.class.getResourceAsStream("/schemas/" + schemaFileName + ".json")));

			JSONObject jsonSubject = new JSONObject(fileContentmap);

			Schema schema = SchemaLoader.load(jsonSchema);
			schema.validate(jsonSubject);

		} catch (ValidationException e) {

			System.out.println(e.toJSON());

			JSONArray array = (JSONArray) e.toJSON().get("causingExceptions");
			/*
			 * int i = 0; do { i++; if (array.length() == 0) {
			 * 
			 * getNextStack(e.toJSON(), errorList); } else {
			 * 
			 * JSONObject jsonObject = (JSONObject) array.get(i); getNextStack(jsonObject,
			 * errorList); } } while (i < array.length());
			 */

			if (array.length() == 0) {

				getNextStack(e.toJSON(), errorList);

			} else {

				for (int i = 0; i < array.length(); i++) {

					if (array.length() == 0) {

						getNextStack(e.toJSON(), errorList);

					} else {

						JSONObject jsonObject = (JSONObject) array.get(i);
						getNextStack(jsonObject, errorList);
					}

				}
			}

		}

		return errorList;

	}

	private static void getNextStack(JSONObject jsonObject, ArrayList errorList) {
		JSONArray array1 = jsonObject.getJSONArray("causingExceptions");
		if (null == array1 || array1.length() < 1) {
			if (jsonObject.get("keyword").equals("type")) {

				addReason(600, jsonObject.get("message") + " for fields " + jsonObject.get("pointerToViolation"),
						errorList);
			}

			if (jsonObject.get("keyword").equals("required")) {

				addReason(601, jsonObject.get("message") + " for fields " + jsonObject.get("pointerToViolation"),
						errorList);

			}

			if (jsonObject.get("keyword").equals("enum")) {

				addReason(600, jsonObject.get("message") + " for fields " + jsonObject.get("pointerToViolation"),
						errorList);
			}
			
			if (jsonObject.get("keyword").equals("pattern")) {

				addReason(600, jsonObject.get("message") + " for fields " + jsonObject.get("pointerToViolation"),
						errorList);
			}
			
			if (jsonObject.get("keyword").equals("format")) {

				addReason(600, jsonObject.get("message") + " for fields " + jsonObject.get("pointerToViolation"),
						errorList);
			}
			return;
		}

		for (int i = 0; i < array1.length(); i++) {
			getNextStack(array1.getJSONObject(i), errorList);
		}

	}

	static void addReason(int code, String desc, ArrayList errorList) {
		HashMap error = new HashMap();
		error.put("ResponseCode", code);
		error.put("ResponseDescription", desc);
		errorList.add(error);
	}

}
