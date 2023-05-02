# Testing

## S E A T approach

  S - Set up the necessary objects

  E - Execute the code against the object were testing

  A - Assert that the executed code did the right thing

  T - Tear down and clean up artifacts

### set up

We can use a setup method to set up out objects in testing. 
 - use an instance variable to contain objects

The set up method is automatically called before each test. 

If the objects differ, ie need arguments, this wont work

The #teardown method is also called AFTER each test. 

## Testing for equality

When we use assert_equal, we are testing for equality according to #==
  - if we want to check if the objects are the same, assert_same checks object id

For custom classes, we need to make sure we have a #== method for the testing suite to use.
  - if it doesn't exist ruby will given a very helpful error message 

## code coverage
   To check the amount of code covered by tests, we add to the start of the test file
   ```ruby 
  require 'simplecov'
  SimpleCov.start
  ```
When we run the test next, we will get a directory in the file system called coverage.
  - the index.html contains the information we need.
The higher the coverage, the better