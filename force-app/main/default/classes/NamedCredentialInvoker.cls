/**
 * This class supports a Lightning component that allows the user to call arbitrary NamedCredential endpoints.
 */
public with sharing class NamedCredentialInvoker {

	@AuraEnabled
	public static List<Object> serverGetNamedCredentials() {

		List<Object> credentials = new List<Object>();

		for(NamedCredential credential : [SELECT DeveloperName, MasterLabel FROM NamedCredential]) {
			credentials.add(
				new Map<String, String>{
					'value' => credential.DeveloperName,
					'label' => credential.MasterLabel
				}
			);
		}

		return credentials;
	}

	@AuraEnabled
	public static void serverSendMessage(String selectedCredential, String message) {

		HttpRequest req = new HttpRequest();
		req.setMethod('POST');
		req.setEndpoint('callout:' + selectedCredential);
		req.setBody(message);

		new Http().send(req);
	}

}