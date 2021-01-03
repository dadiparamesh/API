package com.surchx.transactionfeeapi.utilities;

import java.io.BufferedReader;


import java.io.InputStreamReader;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.junit.Assert;

public class WebserviceClient {

		private HttpResponse httpStatusResponse;
		private String jsonResponse;
		private HttpClient httpClient = HttpClientBuilder.create().build();


		// Sends POST request to API and gets response plus headers as Map
		public boolean sendPostRequest(String serviceUrl, String requestJSON, Map<String, String> headers) {
			HttpPost postRequest = null;
			try {

				System.out.println("serviceUrl = " + serviceUrl);
				System.out.println("requestJSON = " + requestJSON);
				
				httpStatusResponse = null;
				jsonResponse = "";
				postRequest = new HttpPost(serviceUrl);
				if (headers != null) {
					for (Map.Entry<String, String> entry : headers.entrySet()) {
						postRequest.addHeader(entry.getKey(), entry.getValue());
						System.out.println(entry.getKey()+" :"+entry.getValue());
					}
				}
				postRequest.addHeader("content-type", "application/json");
				postRequest.addHeader("accept", "application/json");
				StringEntity params = new StringEntity(requestJSON);
				postRequest.setEntity(params);
	 
				httpStatusResponse = httpClient.execute(postRequest);

				if ((httpStatusResponse.getStatusLine().getStatusCode() != 201)) {
					System.out.println("HttpResponse if not 201 = "
							+ httpStatusResponse.getStatusLine().getStatusCode()
							+ " "
							+ httpStatusResponse.getStatusLine().getReasonPhrase());
					return false;
				}
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(httpStatusResponse.getEntity().getContent())));
				String output;
				while ((output = br.readLine()) != null) {
					jsonResponse += output;
				}
				System.out.println("jsonResponse = " + jsonResponse);

				br.close();
				return true;
				
			} catch (Exception ex) {
				Assert.fail("SendPostRequest failed for url  " + serviceUrl
						+ " Reason " + ex.getMessage());
				ex.printStackTrace();
				return false;
			} finally {
				postRequest.releaseConnection();
			}

		}
		
		// Sends PUT request to API and gets response plus headers as Map
		public boolean sendPutRequest(String serviceUrl, String requestJSON, Map<String, String> headers){
			HttpPut putRequest = null;
			System.out.println("serviceUrl = " + serviceUrl);
			System.out.println("requestJSON = " + requestJSON);

			try {
				httpStatusResponse = null;
				jsonResponse = "";
				putRequest = new HttpPut(serviceUrl);

				if (headers != null) {
					for (Map.Entry<String, String> entry : headers.entrySet()) {
						putRequest.addHeader(entry.getKey(), entry.getValue());
						System.out.println(entry.getKey()+" :"+entry.getValue());
					}
				}

				putRequest.addHeader("content-type", "application/json");
				putRequest.addHeader("accept", "application/json");
				StringEntity params = new StringEntity(requestJSON);
				putRequest.setEntity(params);

				httpStatusResponse = httpClient.execute(putRequest);
				if ((httpStatusResponse.getStatusLine().getStatusCode() != 200)
						&& (httpStatusResponse.getStatusLine().getStatusCode() != 202)) {

					System.out.println("HttpResponse if not 200 = "
							+ httpStatusResponse.getStatusLine().getStatusCode()
							+ " "
							+ httpStatusResponse.getStatusLine().getReasonPhrase());

					return false;
				}
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(httpStatusResponse.getEntity().getContent())));
				String output;
				while ((output = br.readLine()) != null) {
					jsonResponse += output;
				}
				br.close();
				System.out.println("Response : " + jsonResponse);

				return true;
			} catch (Exception ex) {
				Assert.fail("SendPutRequest failed for url  " + serviceUrl
						+ "Reason " + ex.getMessage());
				ex.printStackTrace();
				return false;
			} finally {
				putRequest.releaseConnection();
			}
		}

		// Sends GET request to API and gets response plus headers as Map
		public boolean sendGetRequest(String serviceUrl, Map<String, String> headers) {
			HttpGet getRequest = null;
			try {
				httpStatusResponse = null;
				jsonResponse = "";

				System.out.println(serviceUrl);
				getRequest = new HttpGet(serviceUrl.replace(" ","%20"));

				if (headers != null) {
					for (Map.Entry<String, String> entry : headers.entrySet()) {
						getRequest.addHeader(entry.getKey(), entry.getValue());
						System.out.println(entry.getKey()+" :"+entry.getValue());
					}
				}

				getRequest.addHeader("content-type", "application/json");
				getRequest.addHeader("accept", "application/json");
				httpStatusResponse = httpClient.execute(getRequest);

				if ((httpStatusResponse.getStatusLine().getStatusCode() != 200)
						&& (httpStatusResponse.getStatusLine().getStatusCode() != 202)) {
					System.out.println("Http Response :"
							+ httpStatusResponse.getStatusLine());
					System.out.println("HttpResponse if not 200 = "
							+ httpStatusResponse.getStatusLine().getStatusCode()
							+ " "
							+ httpStatusResponse.getStatusLine().getReasonPhrase());

					return false;
				}
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(httpStatusResponse.getEntity().getContent())));
				String output;
				while ((output = br.readLine()) != null) {
					jsonResponse += output;
				}
				System.out.println("Response : " + jsonResponse);
				br.close();
				return true;

			} catch (Exception ex) {
				Assert.fail("SendGetRequest failed for url  " + serviceUrl
						+ "Reason " + ex.getMessage());
				ex.printStackTrace();
				return false;
			} finally {
				getRequest.releaseConnection();
			}

		}
		
		/*
		 * Get HTTP STATUS response
		 */
		public HttpResponse getHttpStatusResponse() {
			return httpStatusResponse;
		}

		public String getJSONResponse() {
			return jsonResponse;
		}

		

}
