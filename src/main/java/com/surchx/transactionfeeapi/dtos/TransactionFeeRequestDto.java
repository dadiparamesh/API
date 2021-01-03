package com.surchx.transactionfeeapi.dtos;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonFilter;

@JsonFilter("myFilter")
public class TransactionFeeRequestDto {
	
	private String campaign;
	private String country;
	private String region;
	private String processor;
	private String nicn;
	private double amount;
	private String mTxId;
	private String sTxId;
	
	@JsonProperty("campaign")
	public String getCampaign() {
		return campaign;
	}
	public void setCampaign(String campaign) {
		this.campaign = campaign;
	}
	@JsonProperty("country")
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@JsonProperty("region")
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	@JsonProperty("processor")
	public String getProcessor() {
		return processor;
	}
	public void setProcessor(String processor) {
		this.processor = processor;
	}
	@JsonProperty("nicn")
	public String getNicn() {
		return nicn;
	}
	public void setNicn(String nicn) {
		this.nicn = nicn;
	}
	@JsonProperty("amount")
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@JsonProperty("mTxId")
	public String getmTxId() {
		return mTxId;
	}
	public void setmTxId(String mTxId) {
		this.mTxId = mTxId;
	}
	@JsonProperty("sTxId")
	public String getsTxId() {
		return sTxId;
	}
	public void setsTxId(String sTxId) {
		this.sTxId = sTxId;
	}
	
	

}
