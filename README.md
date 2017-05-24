# aerospike_UDF
This repository contains User Defined Functions (UDF) for Aerospike Databases. Aerospike is No-SQL database, which is really fast for getting or putting a single object.
It is basically divided into three components: Namespaces (what in MySQL would be the database), Sets (in MySQL it would be a table) and records. Each bin contains a dictionary of key-value bins. It also provides several operations to be done to a particular bin in a specific record, such as appending an element to a list.
However it doesn't provide several aggregation functions, like getting the maximum value of one particular bin, or getting the top-ten records with the highest bin values, etc.

In this repository I'm going to upload some of UDFs that I had to do for personal projects.
