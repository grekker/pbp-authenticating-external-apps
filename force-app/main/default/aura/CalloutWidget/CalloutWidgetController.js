({
	/**
	 * Called when the component is first loaded.
	 */
	doInit : function(component, event, helper) {

		// call the server and fetch named credentials
		helper.getNamedCredentials(component);
	},

	/**
	 * Send a message to the selected NamedCredential.
	 */
	sendMessage : function(component, event, helper) {

		// call the server and pass it a message and a NamedCredential
		helper.sendMessage(component);
	}
});