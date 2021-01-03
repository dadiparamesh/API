package com.surchx.transactionfeeapi.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertiesLoader {
	
	public static Properties loadProperties(String file) {
		Properties properties = new Properties();
		FileInputStream inputStream;
		try {
			inputStream = new FileInputStream(new File(file));
			properties.load(inputStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return properties;
	}

	
}
