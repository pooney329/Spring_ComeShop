package com.example.Computer.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.example.Computer.auth.NaverAPI20;

public class ImportAcessToken {

	private static ImportAcessToken instance;
	private String import_token;

	private ImportAcessToken() {
	}

	public static ImportAcessToken instance() throws Exception {
		if (instance == null) {
			instance = new ImportAcessToken();
		}
		return instance;

	}

	public String getToken(JSONObject json) throws Exception {

		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보

		String _token = "";
		String requestURL = "https://api.iamport.kr/users/getToken";

		try {

			String requestString = "";

			URL url = new URL(requestURL);

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true);

			connection.setInstanceFollowRedirects(false);

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os = connection.getOutputStream();

			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;

				while ((line = br.readLine()) != null) {

					sb.append(line + "\n");

				}

				br.close();

				requestString = sb.toString();

			}

			os.flush();

			connection.disconnect();

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if ((Long) jsonObj.get("code") == 0) {

				JSONObject getToken = (JSONObject) jsonObj.get("response");

				System.out.println("getToken==>>" + getToken.get("access_token"));

				_token = (String) getToken.get("access_token");

			}

		} catch (Exception e) {

			e.printStackTrace();

			_token = "";

		}

		return _token;

	}

	public String[] paymentsearch(String import_token, String imp_uid) throws Exception {

		String [] cardinfo = new String[2]; //카드결제 정보를 리턴하기위한 배열 
		
		try {
			
			
			
			URL url = new URL("https://api.iamport.kr/payments/" + imp_uid + "?_token=" + import_token);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(5000); // 서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
			// con.addRequestProperty("", "71a83031ed13638d64b4b1d4e8468c5bc0673218");
			// //key값 설정

			con.setRequestMethod("GET");

			// URLConnection에 대한 doOutput 필드값을 지정된 값으로 설정한다. URL 연결은 입출력에 사용될 수 있다. URL 연결을
			// 출력용으로 사용하려는 경우 DoOutput 플래그를 true로 설정하고, 그렇지 않은 경우는 false로 설정해야 한다. 기본값은
			// false이다.

			con.setDoOutput(false);

			StringBuilder sb = new StringBuilder();
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				// Stream을 처리해줘야 하는 귀찮음이 있음.
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				String a = sb.toString();

				// 유니코드를 한글로 변환하는 코드
				StringBuilder sb2 = new StringBuilder();
				char ch;
				int len = a.length();
				for (int i = 0; i < len; i++) {
					ch = a.charAt(i);
					if (ch == '\\' && a.charAt(i + 1) == 'u') {
						sb2.append((char) Integer.parseInt(a.substring(i + 2, i + 6), 16));
						i += 5;
						continue;
					}
					sb2.append(ch);
				}
				System.out.println(sb2.toString());
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(sb2.toString());
				JSONObject jsonObj = (JSONObject) obj;

				JSONObject code = (JSONObject) jsonObj.get("response");
				String cardname = (String) code.get("card_name");
				String buyer_name = (String) code.get("buyer_name");
				
				cardinfo[0]=cardname;
				cardinfo[1]=buyer_name;
				
				

			} else {
				System.out.println(con.getResponseMessage());
			}

		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
		
		return cardinfo;

	}
	
	public void paymentscancel(String import_token, JSONObject json) {
		String amount = "";
		String requestURL = "https://api.iamport.kr/payments/cancel?_token="+import_token+"";
		System.out.println("re : " + requestURL );
		try {

			String requestString = "";

			URL url = new URL(requestURL);

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true);

			connection.setInstanceFollowRedirects(false);

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os = connection.getOutputStream();

			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				System.out.println("정상적인 요청");
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;

				while ((line = br.readLine()) != null) {

					sb.append(line + "\n");

				}

				br.close();

				requestString = sb.toString();

			}
			System.out.println("실패 : =>>>>>>>>>>"+connection.getResponseCode());

			os.flush();

			connection.disconnect();

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if ((Long) jsonObj.get("code") == 0) {

				JSONObject getToken = (JSONObject) jsonObj.get("response");

				System.out.println("amount==>>" + getToken.get("amount"));

				amount = (String) getToken.get("amount");

			}

		} catch (Exception e) {

			e.printStackTrace();

			amount = "";

		}
		
		
		
	}

}
