# The ruby toolbox 
  the tools we explore in this unit are 
  - Rubygems
  - RVM and Rbenv
  - Bundler
  - Rake
 
Rowan note: re read the toolbox book and take notes. 


## setting up project directory. 

Step one with a new project is to set up a directory.
  - name (alphanumeric and _ only). avoid spaces
  - create a repo on github
      -init (initialize)
      - add readme.md
      -commit -m 'initial commit'
    - branch -M main
    remote add origin git@github.com:USERNAME/ project
    push -u origin main

  Test code in test subdirectory
  source files in lib directory
    require relative has path name, ie '../lib/todolist_project'
  assets go in 'asset' subdirectory

## set up gemfile

### configure bundlr

a `Gemfile` needs four pieces of info
- where should bundler look for rubygems it needs to install
- Do you need a gemspec file?
- what version does program require (optional)
- what rubygems does your project need

Most projects find their rubygems at the official rubygems site 
  -source 'https://rubygems.org' in the gemfile

Ruby version. Do you want to support an older version or a specific version?
ie ruby '2.6.0'
  - if not included bundlr will use whatever version it finds by default

Which gems does your program need?
  - the requires in the source code are a good indication of what ones you need
ie 
gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'

We specify the gems we need, aswell as the versions using the same syntax as the ruby version.
  -  "~>" means at least the version number, but not above the next number.
  ie ~> 5.10 means we want at least 5.10, but before 6.0.

Then run bundle install and it will install the correct gems and versions provided.
 - installs all the gems and dependencies
 - creates a Gemfile.lock that contains all the dependency information

when we update the gemfile, we should run this again.

## Setting up a Rakefile

Create a `Rakefile` in the top directory of the project
- add the rake gem to the gemfile
to run use `bundle exec rake` with the given task at the end. 
  - -T displays all the tasks associated with the rakefile
  - use the task name to run a task

A common task is to run tests to make sure everything still works 

```ruby 
desc 'Run tests'
task :test do
  sh 'ruby ./test/todolist_project_test.rb'
end
```
We can set a task as the default task aswell.
```ruby
desc 'Run tests'
task :default => :test
```

rake/testtask can build the list of tests for us. 
modifiy the Rakefile to look like this

```ruby
require "rake/testtask"

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

## preparing a Rubygem

The most common distribution for ruby projects is rubygems. This requires somethings 
- a comoon directory structure 
- a .gemspec file
    - names as project_name.gemspec
- add `gemspec` to your gemfile
- Modify the rakefile to include the standard Rubygem tasks

a simple gemspec file example 

```ruby 
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Pete Williams']
  s.email       = 'pw@example.com'
  s.homepage    = 'http://example.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
```

- add `require "bundler/gem_tasks"` to the rakefile
  - defines standard tasks
    - rake build 
      -constructs a .gem file in the pkg directory. This contains the actual distribution rubygem
    -rake install
      -runs `rake build` then installs the program in your ruby gem directory
        - can test the gem without having to load the info from the project directory
    -rake release
      - send your .gem file the remote Rubygem library for the world to download

bundler/gemtasks provides more tasks, but build install and release are the primary ones

Follow the directions on Rubygems website to package and release


