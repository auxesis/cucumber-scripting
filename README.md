Scripting with Cucumber
=======================

This repo is the result of a thought experiment explored in an open space at 
[devopsdays](http://devopsdays.org) 2009 in Gent, Belgium. Everything in this 
repo was produced in a group coding session. 

The idea was to use Cucumber as a scripting language, with our initial 
implementation focusing on manipulating files. 

We proved that it was possible to build a common library of steps for doing 
file manipulation that was both understandable to non-technical users, and 
as concise (but more expressive than) a bash script.

Setup
-----

Clone the repository, and run `gem bundle` within the checked out code. 

Running
-------

To run the example script, use the following command line: 

   bin/cucumber --require features/ features/example-script.feature

Contributing
------------

Please fork and experiment! We want to find other ways of using Cucumber for
general sysadmin tasks.
