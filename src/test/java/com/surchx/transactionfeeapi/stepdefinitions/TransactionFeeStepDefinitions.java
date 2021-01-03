package com.surchx.transactionfeeapi.stepdefinitions;

import com.surchx.transactionfeeapi.steps.TransactionFeeApiSteps;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class TransactionFeeStepDefinitions{

	@Steps
	TransactionFeeApiSteps transactionFeeApiSteps;
	
	
	@When("^I call Transaction Fee API with the following data$")
	public void callTransactionFeeApi(DataTable request) {
		transactionFeeApiSteps.loadTransactionFeeApiRequest(request);
		transactionFeeApiSteps.executeTransactionFeeApiRequest();	
	}
	
	@Then("^Verify the response is as follows$")
	public void verifyTheResponse(DataTable response) {
		transactionFeeApiSteps.loadExpectedApiResponse(response);
		transactionFeeApiSteps.verifyResponse();
	}
	
	
	@Then("^Get the response$")
	public void getTheResponse() {
		transactionFeeApiSteps.getResponse();
	}
	
	
}
