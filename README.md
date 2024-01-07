# pyODBCtest
This repo contains a way for Go codebase to make queries towards IRISDB using a python script and pyODBC as an interface. 
The workflow for the above described method are as follows: Go script os/exec python script -> Within the python script contains connection to IRIS via the native pyODBC -> python script also executes the SQL and returns to the go program. 

***
Installation Steps

##1. Install the IRIS DB-API drivers by:
- Clone https://github.com/intersystems-community/iris-driver-distribution
- install the python driver by ```cd db-api``` followed by ```pip install intersystems_irispython-3.2.0-py3-none-any.whl```

##2. Clone this repo 

##3. In Script.py modify the connection string, username and password to match the credentials of your IRIS instance (at this point your IRIS instance should already be running)

##4. Modify the query to suit the data you're trying to pull from IRIS DB. More info could be found on https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=BPYNAT_pyapi

##5. Once ready, run ```go run main.go```

