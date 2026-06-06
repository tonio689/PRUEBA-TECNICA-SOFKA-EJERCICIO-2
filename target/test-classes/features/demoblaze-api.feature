Feature: Pruebas API Demoblaze

Scenario: Flujo completo Signup y Login

    # Datos dinámicos
    * def random = java.lang.System.currentTimeMillis()
    * def username = 'usuarioSofka' + random
    * def password = '123456'

    # CASO 1: Crear usuario nuevo
    Given url 'https://api.demoblaze.com/signup'
    And request
    """
    {
      "username": "#(username)",
      "password": "#(password)"
    }
    """
    When method post
    Then status 200

    * print '=== CASO 1: CREAR USUARIO NUEVO ==='
    * print 'USUARIO:', username
    * print 'RESPUESTA:', response

    # CASO 2: Intentar crear usuario existente
    Given url 'https://api.demoblaze.com/signup'
    And request
    """
    {
      "username": "#(username)",
      "password": "#(password)"
    }
    """
    When method post
    Then status 200

    * print '=== CASO 2: USUARIO EXISTENTE ==='
    * print 'RESPUESTA:', response

    And match response.errorMessage == 'This user already exist.'

    # CASO 3: Login correcto
    Given url 'https://api.demoblaze.com/login'
    And request
    """
    {
      "username": "#(username)",
      "password": "#(password)"
    }
    """
    When method post
    Then status 200

    * print '=== CASO 3: LOGIN CORRECTO ==='
    * print 'RESPUESTA:', response

    # CASO 4: Login incorrecto
    Given url 'https://api.demoblaze.com/login'
    And request
    """
    {
      "username": "#(username)",
      "password": "passwordIncorrecto"
    }
    """
    When method post
    Then status 200

    * print '=== CASO 4: LOGIN INCORRECTO ==='
    * print 'RESPUESTA:', response