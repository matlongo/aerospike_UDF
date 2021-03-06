# Aerospike UDFs
This repository contains User Defined Functions (UDF) for Aerospike Databases. Aerospike is No-SQL database, which is really fast for getting or putting a single object.
It is basically divided into three components: Namespaces (what in MySQL would be the database), Sets (in MySQL it would be a table) and records. Each bin contains a dictionary of key-value bins. It also provides several operations to be done to a particular bin in a specific record, such as appending an element to a list.
However it doesn't provide several aggregation functions, like getting the maximum value of one particular bin, or getting the top-ten records with the highest bin values, etc.

In this repository I'm going to upload some of UDFs that I had to do for personal projects.

## Top n Aerospike

First of all, you will see the top_ten.lua, which will return the *n* records with the highest amount of users. It makes use of the map-reduce strategy that Aerospike uses for aggregations. Basically, it first transforms the records, it then aggregates a set of transformed records and, finally, it reduces several aggregations. The ***transform*** methods takes a record with several bins, and returns a record with only the fields that are important for the rest of the process. The ***aggregate*** method takes a list of records, which is the provisional aggregation, and a new record to be added. If the new record's amount of users is higher than any of the already records in the aggregation, it simply makes space in the aggregation and removes the record with the least amount of users. Lastly, the ***reduce*** takes in two aggregations sorted in descending order and, iteratively, compares the two tops and uses the highest one until getting the number of records specified by parameter. 

It is a cleaner and more compact implementation than the one [posted by Aerospike](http://www.aerospike.com/blog/top-10-aerospike-aggregations/).
