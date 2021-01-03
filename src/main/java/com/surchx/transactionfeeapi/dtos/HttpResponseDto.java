package com.surchx.transactionfeeapi.dtos;

public class HttpResponseDto {

	private int httpCode;
	private String httpResponseMessage;
	
	public int getHttpCode() {
		return httpCode;
	}
	public void setHttpCode(int httpCode) {
		this.httpCode = httpCode;
	}
	public String getHttpResponseMessage() {
		return httpResponseMessage;
	}
	public void setHttpResponseMessage(String httpResponseMessage) {
		this.httpResponseMessage = httpResponseMessage;
	}
	
	
	
}
