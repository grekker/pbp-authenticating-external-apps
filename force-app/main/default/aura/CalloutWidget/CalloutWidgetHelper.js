({
	/**
	 * Fetch a list of NamedCredential records from the server.
	 */
	getNamedCredentials : function(component) {

		var action = component.get('c.serverGetNamedCredentials');
		action.setCallback(this, function(response){
			component.set('v.availableCredentials', response.getReturnValue());
		});
		$A.enqueueAction(action);
	},

	/**
	 * Send a message to the endpoint for the selected NamedCredential.
	 */
	sendMessage : function(component) {

		var action = component.get('c.serverSendMessage');
		action.setParams({
			'selectedCredential' : component.get('v.selectedCredential'),
			'message' : component.get('v.textToSend')
		});
		$A.enqueueAction(action);
	}
});