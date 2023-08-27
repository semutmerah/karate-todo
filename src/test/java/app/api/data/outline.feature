Feature: simple data driven testing

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase + '/api/todos'

  Scenario Outline: Add 10 todos
    * request { title: '#(title)', complete: false }
    * method post
    * match response == { id: '#string', title: '#(title)', complete: false }
    * status 200

    Examples:
      | title |
      | Mandiin Kucing |
      | Mandiin Anak |
      | Masak |
      | Nyuci Baju |
      | Nyetrika |
      | Tidur |
      | Berenang |
      | Jogging |
      | Ngepel |
      | Belajar |
