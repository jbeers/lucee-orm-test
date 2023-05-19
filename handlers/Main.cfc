component extends="coldbox.system.EventHandler" {

	function stop(){
		applicationstop();
		abort;
	}

	function demonstrate_missing_data_in_preinsert( event, rc, prc ){
		var thingRes = queryExecute( "SELECT TOP 1 GUID FROM dbo.Thing", [], {dataSource: 'testdb' } );
		var thing = thingRes.recordCount ? entityLoadByPK('Thing', thingRes.GUID[1] ) : entityNew( 'Thing' ); 

		thing.setName( 'Thing Test' & getTickCount() );

		entitySave( thing );
		ormflush();

		var t1 = entitynew( 'TableOne' );
		t1.setName( 'Test 1' );

		entitySave( t1 );
		ormflush();

		var t2 = entitynew( 'TableOne' );
		t2.setName( 'Test 2' );

		entitySave( t2 );
		ormflush();

		var thingRes = queryExecute( "SELECT TOP 1 GUID FROM dbo.Thing", [], {dataSource: 'testdb' } );
		var thing = thingRes.recordCount ? entityLoadByPK('Thing', thingRes.GUID[1] ) : entityNew( 'Thing' ); 
		thing.setName( 'Thing Test' & getTickCount() );
		entitySave( thing );
		ormflush();

		var res = queryExecute(
			"
				SELECT * FROM dbo.TableOne
				UNION
				SELECT * FROM dbo.TableTwo
				UNION
				SELECT * FROM dbo.Thing
			",
			{},
			{ dataSource: 'testdb' }
		);

		writeDump( res );
		abort;
	}

	function demonstrate_eventhandlers_not_firing_in_cborm( event, rc, prc ){
		var thing = getInstance( 'Thing@testmodule' ).newCriteria().iLike( 'Name', 'Thing Test%' ).get();
		
		if( isNull( thing ) ){
			thing = getInstance( 'Thing@testmodule' );
		}

		thing.setName( 'Thing Test' & getTickCount() );

		thing.save();

		var t1 = getInstance( 'TableOne' );
		t1.setName( 'Test 1' );

		t1.save();

		var t2 = getInstance( 'TableTwo' );
		t2.setName( 'Test 2' );

		t2.save();

		var thing = getInstance( 'Thing@testmodule' ).newCriteria().iLike( 'Name', 'Thing Test%' ).get();
		thing.setName( 'Thing Test' & getTickCount() );

		thing.save();

		var res = queryExecute(
			"
				SELECT * FROM dbo.TableOne
				UNION
				SELECT * FROM dbo.TableTwo
				UNION
				SELECT * FROM dbo.Thing
			",
			{},
			{ dataSource: 'testdb' }
		);

		writeDump( res );
		abort;
	}

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

	


}
