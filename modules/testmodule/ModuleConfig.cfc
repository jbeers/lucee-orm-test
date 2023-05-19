/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 * ColdBox ORM enhancements for Hibernate
 */
component {

	// Module Properties
	this.title          = "testmodule";
	this.author         = "Ortus Solutions";
	this.webURL         = "https://www.ortussolutions.com";
	this.description    = "ColdBox ORM enhancements for Hibernate";
	this.modelNamespace = "testmodule";
	this.cfmapping      = "testmodule";
	this.autoMapModels = true;
	this.dependencies   = [
		// "cborm"
	];

	variables.SETTING_DEFAULTS = {
		// Resource Settings
		resources : {
			// Enable the ORM Resource Event Loader
			eventLoader  : false,
			// Prefix to use on all the registered pre/post{Entity}{Action} events
			eventPrefix  : "",
			// Pagination max rows
			maxRows      : 25,
			// Pagination max row limit: 0 = no limit
			maxRowsLimit : 500
		},
		// WireBox Injection Bridge
		injection : { enabled : true, include : "", exclude : "" }
	};

	/**
	 * Configure Module
	 */
	function configure(){
		// cborm Settings
		settings = structCopy( variables.SETTING_DEFAULTS );

		ormGetSession();

		
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
	
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
