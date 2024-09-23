
@E2E
Feature: Verificación de Endpoints en ReqRes

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  @GET
  Scenario: Verificar el listado de usuarios (GET)
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
     # Validación de la estructura principal
    And match response == { page: 2, per_page: 6, total: 12, total_pages: 2, data: '#[]', support: { url: '#string', text: '#string' } }


  @POST
  Scenario: Crear un nuevo usuario (POST)
    Given path 'users'
    And request read('classpath:data/user.json')
    When method POST
    Then status 201
    And match response contains read('classpath:data/response.json')

  @PUT
  Scenario: Actualizar un usuario existente (PUT)
    Given path 'users/2'
    And request read('classpath:data/update-user.json')
    When method PUT
    Then status 200
    And match response contains read('classpath:data/expected-put-response.json')

  @DELETE
  Scenario: Eliminar un usuario (DELETE)
    Given path 'users/2'
    When method DELETE
    Then status 204
