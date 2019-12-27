if( vars.applicationObjectData.Product_Code__c != "CUP_CARD") {
	      "SourceOfWealth": vars.employmentObjectData.Primary_Income_Source_NRA__c default null,
	      "PurposeOfAccount": vars.employmentObjectData.Primary_Account_Purpose_NRA__c default null,
	      "IntendInternationalWires": vars.employmentObjectData.International_Transactions_NRA__c default null,
	      "IntendIncomingWires": vars.employmentObjectData.Receive_International_Transactions__c default null,
	      "IncomingWiresLimit": vars.employmentObjectData.Excepted_Transactional_NRA__c default null,
	      "IntendOutgoingWires": vars.employmentObjectData.Conduct_International_Transaction_NRA__c default null,
	      "OutgoingWiresLimit": vars.employmentObjectData.Receive_International_Amount__c default null,
	      "VisaType": vars.applicationObjectData.Custom_Picklist9__c default null,
	      "ForeignTaxNumber": vars.applicationObjectData.Custom_Text17__c default null,
	      "PreferredName": vars.applicationObjectData.Preferred_First_Name__c default null
	} else {}