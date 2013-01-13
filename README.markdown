# Sample ADF application for Oracle WebCenter Portal and WebCenter Content

There are not many samples around for WebCenter and ADF. Hope that one
is not too bad and helps one or two programmers fighting this heavy
weight.

Developers: István Kocsis and Horst Kapfenberger

## Installation

### What you need

+ Oracle WebCenter Portal and Content 11.1.1.6 installation

### Deploy the schema

Run the script in sql/ddl with sqlplus. If you use a new schema for the
objects, you need to grant select permission to the content server user
and create synonyms for it.

## Compilation

Open the applications in JDeveloper. Build "CustomerTaskFlow" 
as jar and then build "GlobalSupportUnit", which uses that task flows
and creates a WebCenter application.

PS: I hope this information helps you. Please don't expect more ADF apps
coming from my side... So glad this is over....!!! :-)

