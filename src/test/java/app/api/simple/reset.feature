Feature: helper to clear all todos

Scenario: Delete all todos
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * path 'api', 'reset'
  * method get
  * status 200

Scenario: Assert that all todos now empty
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase + '/api/todos'
  * method get
  * status 200
  * print response
  * match response == []
