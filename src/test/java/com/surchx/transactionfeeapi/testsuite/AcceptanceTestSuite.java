package com.surchx.transactionfeeapi.testsuite;

import org.junit.runner.RunWith;
import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(features="src/test/resources/features/commonscenarios/transaction_fee_api_failure_scenarios.feature",
glue= {"com/surchx/transactionfeeapi/stepdefinitions"})
public class AcceptanceTestSuite{

}
