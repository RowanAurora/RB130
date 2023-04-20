# Bundler 

Bundler deals with dependancies,  multiple versions of ruby and of gems. Bundler groups dependant versions for apps.

Bundler relies on a text file named `Gemfile` to tell what versions to use. Domain specific language to provide details about versions, ie a config file

When created, bundler then scans, downloads and installs all the dependancies and and makes a 
`Gemfile.lock`. THis shows all the dependencies in your app, gems and the gems they relies on.

`bundle` is the command to use. although bundler works

add at start of app, before gems or anything `require 'bundler/setup'

