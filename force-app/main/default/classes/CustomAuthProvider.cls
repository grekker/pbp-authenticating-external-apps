public with sharing class CustomAuthProvider extends Auth.AuthProviderPluginClass {

	private static String redirectUrl = 'https://fun-connect-1108-dev-ed.cs65.my.salesforce.com/services/authcallback/Custom';

	public String getCustomMetadataType() {
		return 'Auth__mdt';
	}

	public PageReference initiate(Map<String, String> config, String stateToPropagate) {
		System.debug(LoggingLevel.WARN, 'initiate-config: ' + config);
		System.debug(LoggingLevel.WARN, 'initiate-stateToPropagate: ' + stateToPropagate);
		String url = config.get('Token_Endpoint__c');
		url += '?redirect_uri=' + redirectUrl + '&state=' + stateToPropagate;
		return new PageReference(url);
	}

	public Auth.AuthProviderTokenResponse handleCallback(Map<String, String> config, Auth.AuthProviderCallbackState callbackState) {
		System.debug(LoggingLevel.WARN, 'handleCallback-config: ' + config);
		System.debug(LoggingLevel.WARN, 'handleCallback-callbackState: ' + callbackState);
		System.debug(LoggingLevel.WARN, 'handleCallback-token: ' + callbackState.queryParameters.get('token'));
		return new Auth.AuthProviderTokenResponse('PbP', callbackState.queryParameters.get('token'), null, callbackState.queryParameters.get('state'));
	}

	public Auth.UserData getUserInfo(Map<String, String> config, Auth.AuthProviderTokenResponse response) {
		System.debug(LoggingLevel.WARN, 'getUserInfo-config: ' + config);
		System.debug(LoggingLevel.WARN, 'getUserInfo-response: ' + response);
		return new Auth.UserData('fakeId', 'first', 'last', 'full', 'email', 'link', null, null, null, null, null);
	}

	public override Auth.OAuthRefreshResult refresh(Map<String, String> config, String refreshToken) {
		System.debug(LoggingLevel.WARN, 'refresh-config: ' + config);
		System.debug(LoggingLevel.WARN, 'refresh-refreshToken: ' + refreshToken);
		return null;
	}
}