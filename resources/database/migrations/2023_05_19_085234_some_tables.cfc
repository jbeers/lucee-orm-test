component {
    
    function up( schema, qb ) {
        schema.create( "dbo.TableOne", function( t ){
            t.uuid( "GUID" ).default( "NEWID()" ).primaryKey();
            t.string( "Name", 50 );
        });

        schema.create( "dbo.TableTwo", function( t ){
            t.uuid( "GUID" ).default( "NEWID()" ).primaryKey();
            t.string( "Namex", 50 );
        });

        schema.create( "dbo.Thing", function( t ){
            t.uuid( "GUID" ).default( "NEWID()" ).primaryKey();
            t.string( "Name", 50 );
        });
    }

    function down( schema, qb ) {
        schema.drop( "dbo.TableOne" );
        schema.drop( "dbo.TableTwo" );
        schema.drop( "dbo.Thing" );
    }

}
