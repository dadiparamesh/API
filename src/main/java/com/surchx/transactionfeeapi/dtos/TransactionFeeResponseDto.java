package com.surchx.transactionfeeapi.dtos;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonFilter;


@JsonFilter("filterAClass")
public class TransactionFeeResponseDto {
	
	private double transactionFee;
//	private double fee;
	private String sid;
	private String message;
	
	@JsonProperty("transactionFee")
	public double getTransactionFee() {
		return transactionFee;
	}
	public void setTransactionFee(double transactionFee) {
		this.transactionFee = transactionFee;
	}
//	@JsonProperty("fee")
//	public double getFee() {
//		return fee;
//	}
//	public void setFee(double fee) {
//		this.fee = fee;
//	}
	@JsonProperty("sTxId")
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@JsonProperty("message")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	

}
