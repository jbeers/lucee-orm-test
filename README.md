docker compose up
box migrate fresh
open up lucee administrator (password is coldbox)
    remove lucee orm extension
    install latest ortus orm extension
navigate to http://localhost:8080/?stop
navigate to http://localhost:8080/main/demonstrate_missing_data_in_preinsert
navigate to http://localhost:8080/main/demonstrate_eventhandlers_not_firing_in_cborm

My expectation is that both of the test URLs should return the same output (except that the query rows should always increase by two)
demonstrate_missing_data_in_preinsert correctly runs the preInsert() for every entity
demonstrate_eventhandlers_not_firing_in_cborm fails to run the preInsert() functions for TableOne and TableTwo
Both routes show the wrong data in preInsert()
