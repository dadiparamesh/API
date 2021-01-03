package com.surchx.transactionfeeapi.steps;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ser.FilterProvider;
import org.codehaus.jackson.map.ser.impl.SimpleBeanPropertyFilter;
import org.codehaus.jackson.map.ser.impl.SimpleFilterProvider;
import org.junit.Assert;

import com.surchx.transactionfeeapi.constants.AuthenticationTokens;
import com.surchx.transactionfeeapi.constants.TestData;
import com.surchx.transactionfeeapi.dtos.HttpResponseDto;
import com.surchx.transactionfeeapi.dtos.TransactionFeeRequestDto;
import com.surchx.transactionfeeapi.dtos.TransactionFeeResponseDto;
import com.surchx.transactionfeeapi.utilities.PropertiesLoader;
import com.surchx.transactionfeeapi.utilities.WebserviceClient;

import cucumber.api.DataTable;
import net.thucydides.core.annotations.Step;

public class TransactionFeeApiSteps {

	public static final String testData = "src/test/resources/data/testdata.properties";
	public static final String serviceUrl = "https://api-test.surchx.com/v1/ch";
	public static String requestJsonString = null;
	public static ObjectMapper mapper = new ObjectMapper();
	TransactionFeeRequestDto transactionFeeRequestDto;
	TransactionFeeResponseDto actualTransactionFeeResponseDto;
	TransactionFeeResponseDto expectedTransactionFeeResponseDto;
	WebserviceClient webservice;
	HttpResponseDto httpResponseDto = new HttpResponseDto();
	String nicn;
	String merchant;
	
	
	@Step
	public void loadTransactionFeeApiRequest(DataTable request) {
		
		transactionFeeRequestDto = new TransactionFeeRequestDto();
		
		List<Map<String, String>> requestData = request.asMaps(String.class, String.class);
		
		merchant = requestData.get(0).get("Merchant");
		nicn = requestData.get(0).get("NICN");
		String amount = requestData.get(0).get("Amount");
		String region = requestData.get(0).get("Region");
		String processor = requestData.get(0).get("Processor");
		String campaign = requestData.get(0).get("Campaign");
		String country = requestData.get(0).get("Country");
		String mTxId = requestData.get(0).get("MTxId");
		String sTxId = requestData.get(0).get("STxId");
		
		if(country == null)
			country = "840";
		
		transactionFeeRequestDto.setNicn(evaluateValue(evaluateNicn(nicn)));
		transactionFeeRequestDto.setAmount(Double.parseDouble(evaluateNumberInput(amount)));
		transactionFeeRequestDto.setRegion(evaluateValue(evaluateRegion(region)));
		transactionFeeRequestDto.setProcessor(evaluateValue(processor));
		transactionFeeRequestDto.setCampaign(campaign);
		transactionFeeRequestDto.setCountry(country);
		transactionFeeRequestDto.setmTxId(mTxId);
		transactionFeeRequestDto.setsTxId(sTxId);
		
		try {
			requestJsonString = mapper.writer(filterFieldsFromARequest(requestData)).writeValueAsString(transactionFeeRequestDto);
			System.out.println("\nRequest: "+ requestJsonString+"\n");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String evaluateNumberInput(String value) {
		if(value != null) {
			
			if(value.equalsIgnoreCase("null"))
				return "0";
			
		}
		return value;
	}

	private String evaluateValue(String value) {
		if(value != null) {
			
			if(value.equalsIgnoreCase("null"))
				return null;
			if(value.equalsIgnoreCase("empty"))
				return "";
			if(value.equalsIgnoreCase("%space%"))
				return " ";
		}
		
		return value;
	}

	private FilterProvider filterFieldsFromARequest(List<Map<String, String>> requestData) {
		Map<String, String> requestDataRow = requestData.get(0);
		Set<String> fieldToBeFiltered = new HashSet<String>();
		
		for(Map.Entry<String, String> requestDataColumn : requestDataRow.entrySet()) {
			if(requestDataColumn.getValue().equalsIgnoreCase("skip")){
				fieldToBeFiltered.add(requestDataColumn.getKey().toLowerCase());
			}
		}
		SimpleBeanPropertyFilter theFilter = SimpleBeanPropertyFilter.serializeAllExcept(fieldToBeFiltered);
		FilterProvider filters = new SimpleFilterProvider().addFilter("myFilter", theFilter);
		
		return filters;

	}

	private String evaluateRegion(String region) {
		
		if(region.equalsIgnoreCase("Chargeable state"))
			region = TestData.CHARGEABLE_STATE;
		else if(region.equalsIgnoreCase("Non-Chargeable state"))
			region = TestData.NON_CHARGEABLE_STATE;
			
		return region;
	}

	private String evaluateNicn(String nicn) {
		String previousNicn = nicn;
		Properties properties = PropertiesLoader.loadProperties(testData);
		nicn = properties.getProperty(nicn+"NICN");
		if(nicn == null)
			return previousNicn;
		return nicn;
	}

	@Step
	public void executeTransactionFeeApiRequest() {
		webservice = new WebserviceClient();
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("x-requested-with", "xhr");
		headers.put("content-type", "application/json");
		headers.put("authorization", "Bearer "+ getAuthToken(transactionFeeRequestDto.getProcessor()));
		webservice.sendPostRequest(serviceUrl, requestJsonString, headers);
		
	}
	
	private String getAuthToken(String processor){
		
		String authToken = null;
		if(processor == null)
			processor = "null";
		switch(merchant+"_"+processor) {
				
		case "Coastline_Paysafe7861":
			authToken = AuthenticationTokens.COASTLINE_PAYSAFE7861_AUTHENTICATION_TOKEN;
			break;
		case "Coastline_Paysafe9909":
			authToken =  AuthenticationTokens.COASTLINE_PAYSAFE9909_AUTHENTICATION_TOKEN;
			break;
		case "Coastline_Titanium4994":
			authToken =  AuthenticationTokens.COASTLINE_TITANIUM4994_AUTHENTICATION_TOKEN;
			break;
		case "Coastline_Paymentworld5654":
			authToken =  AuthenticationTokens.COASTLINE_PAYMENTWORLD5654_AUTHENTICATION_TOKEN;
			break;
		case "Coastline_Paymentworld6963":
			authToken =  AuthenticationTokens.COASTLINE_PAYMENTWORLD6963_AUTHENTICATION_TOKEN;
			break;
		case "Coastline_invalid":case "Coastline_":case "Coastline_ ": case "Coastline_null": case "Coastline_skip":
			authToken =  AuthenticationTokens.COASTLINE_TITANIUM4994_AUTHENTICATION_TOKEN;
			break;
			
		default:
			authToken = "Not found";
		}
		
		return authToken;
		
	}

	@Step
	public void loadExpectedApiResponse(DataTable response) {
		Properties properties = PropertiesLoader.loadProperties("src/test/resources/data/testdata.properties");
		List<Map<String, String>> expectedResponseData = response.asMaps(String.class, String.class);
		
		String httpStatusCode = expectedResponseData.get(0).get("HttpStatusCode");
		String transactionFee = expectedResponseData.get(0).get("TransactionFee");
//		String fee = expectedResponseData.get(0).get("Fee");
		String sid = expectedResponseData.get(0).get("Sid");
		String message = expectedResponseData.get(0).get("Message");
		
		double amount = transactionFeeRequestDto.getAmount();
		httpResponseDto.setHttpCode(Integer.parseInt(httpStatusCode));
				
		double expectedTransactionFee =  getEvaluatedTransactionFee(amount, transactionFee, properties);
		double expectedTransactionFeeMaxed = getTransactionFeeMaxed(amount, expectedTransactionFee);
//		double expectedFee = getEvaluatedFee(amount, fee, expectedTransactionFee, expectedTransactionFeeMaxed, properties);
		expectedTransactionFeeResponseDto = new TransactionFeeResponseDto();
		expectedTransactionFeeResponseDto.setTransactionFee(expectedTransactionFeeMaxed);
//		expectedTransactionFeeResponseDto.setFee(expectedFee);
		expectedTransactionFeeResponseDto.setSid(sid);
		expectedTransactionFeeResponseDto.setMessage(message);
		
	}

	private Double getTransactionFeeMaxed(double amount, Double expectedTransactionFee) {
		double surchargeMaxAmount = amount * 0.04;
		DecimalFormat format = new DecimalFormat("##.00");
		surchargeMaxAmount = Double.parseDouble(format.format(surchargeMaxAmount));
		if(expectedTransactionFee > surchargeMaxAmount)
			return surchargeMaxAmount;
		else
			return expectedTransactionFee;
	}
	
/*	private double getEvaluatedFee(double amount, String fee, double expectedTransactionFee, double expectedTransactionFeeMaxed, Properties properties) {
		double feePercentage = Double.parseDouble(properties.getProperty("SurchxPercentage"));
		double feeAmount = amount * feePercentage;
		double surchargeMaxAmount = amount * 0.04;
		DecimalFormat format = new DecimalFormat("##.00");
		feeAmount = Double.parseDouble(format.format(feeAmount));
		if(fee.equals("SurchxPercentage")) {
			if(expectedTransactionFee > surchargeMaxAmount) {
				double feeMaxed = feeAmount - (expectedTransactionFee - expectedTransactionFeeMaxed);
				feeMaxed = Double.parseDouble(format.format(feeMaxed));
				if(feeMaxed < 0)
					return 0.00;
				else
					return feeMaxed; 
			}else
				return feeAmount;
		}else {
			double expectedFee = Double.parseDouble(fee);
			return expectedFee;
		}
			
	}
*/

	private Double getEvaluatedTransactionFee(double amount, String transactionFee, Properties properties) {
		
		double expectedtransactionFee = 0;
		Map<String, String> values = new HashMap<String, String>();

		if(transactionFee.contains(":")) {
			
			String[] calculationFactors = transactionFee.split(":");
		
			values.put("FixedFee", properties.getProperty("InterchangeFixedFee"));
			values.put("Interchange", properties.getProperty(nicn +"InterchangeFeePercentage"));
			values.put("GatewayMarkup", properties.getProperty(transactionFeeRequestDto.getProcessor()+"GatewayMarkupPercentage"));
			values.put("NetworkFee", properties.getProperty(transactionFeeRequestDto.getProcessor()+"NetworkFee"));
			values.put("SurchxPercentage", properties.getProperty("SurchxPercentage"));
			values.put("TierQualifiedPercentage", properties.getProperty(transactionFeeRequestDto.getProcessor()+"TierQualifiedPercentage"));
			values.put("TierFixedFee", properties.getProperty(transactionFeeRequestDto.getProcessor()+"TierFixedFee"));
		
			double temp = 0;
		
			for(String value: calculationFactors) {
			
				if(value.contains("Fee")) {
					temp = Double.parseDouble(values.get(value));
					expectedtransactionFee = expectedtransactionFee + temp;
				}else {
					double percentageParsedValue = Double.parseDouble(values.get(value));
					expectedtransactionFee = expectedtransactionFee + (amount * percentageParsedValue);				
				}
			
			}
			
			DecimalFormat format = new DecimalFormat("##.00");
			expectedtransactionFee = Double.parseDouble(format.format(expectedtransactionFee));
			
		}else {
			expectedtransactionFee = Double.parseDouble(transactionFee);
		}
		
		return expectedtransactionFee;
	}

	@Step
    	public void verifyResponse() {
		
		try {
			actualTransactionFeeResponseDto = mapper.readValue(webservice.getJSONResponse(), TransactionFeeResponseDto.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Assert.assertEquals("Http status code is not as expected", httpResponseDto.getHttpCode(), webservice.getHttpStatusResponse().getStatusLine().getStatusCode());
		Assert.assertEquals("Transaction Fee is not as expected", expectedTransactionFeeResponseDto.getTransactionFee(), actualTransactionFeeResponseDto.getTransactionFee(), 0);
//		Assert.assertEquals("Fee is not as expected",expectedTransactionFeeResponseDto.getFee(), actualTransactionFeeResponseDto.getFee(), 0);
		
		if(expectedTransactionFeeResponseDto.getSid()!=null && expectedTransactionFeeResponseDto.getSid().equalsIgnoreCase("NotNull"))
			Assert.assertNotNull("Sid is null", actualTransactionFeeResponseDto.getSid());
		else 
			Assert.assertEquals("Sid is not as expected", expectedTransactionFeeResponseDto.getSid(), actualTransactionFeeResponseDto.getSid());
		Assert.assertTrue("Message is not as expected", actualTransactionFeeResponseDto.getMessage().contains(expectedTransactionFeeResponseDto.getMessage()));
		
	}
	
	
	@Step

	public void getResponse() {
		try {
			actualTransactionFeeResponseDto = mapper.readValue(webservice.getJSONResponse(), TransactionFeeResponseDto.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("***********************");
		System.out.println(httpResponseDto.getHttpCode());
		System.out.println(webservice.getJSONResponse());
		System.out.println(webservice.getHttpStatusResponse().getStatusLine().getStatusCode());
		System.out.println(expectedTransactionFeeResponseDto.getMessage());
		
		
	}
}
