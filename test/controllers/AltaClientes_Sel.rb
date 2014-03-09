require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class AltaClientes_Sel < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://still-meadow-3217.herokuapp.com/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
 # def teardown
 #   @selenium.close_current_browser_session
 #   assert_equal [], @verification_errors
 # end
  
  def test_alta_clientes__sel
    @selenium.open "/"
    @selenium.click "link=Crear Cliente"
    assert !60.times{ break if (@selenium.is_element_present("id=cliente_c_targeta_cliente") rescue false); sleep 1 }
    @selenium.type "id=cliente_c_targeta_cliente", "12345"
    assert_equal "12345", @selenium.get_value("id=cliente_c_targeta_cliente")
    @selenium.type "id=cliente_nombre", "Ana Laura"
    assert_equal "Ana Laura", @selenium.get_value("id=cliente_nombre")
    @selenium.type "id=cliente_a_paterno", "Hernandez"
    assert_equal "Hernandez", @selenium.get_value("id=cliente_a_paterno")
    @selenium.type "id=cliente_a_materno", "Saucedo"
    assert_equal "Saucedo", @selenium.get_value("id=cliente_a_materno")
    @selenium.type "id=cliente_email", "ana_1508@hotmail.com"
    assert_equal "ana_1508@hotmail.com", @selenium.get_value("id=cliente_email")
    @selenium.type "id=cliente_domicilio", "Sauceda de la Borda"
    assert_equal "Sauceda de la Borda", @selenium.get_value("id=cliente_domicilio")
    @selenium.type "id=cliente_c_postal", "98600"
    assert_equal "98600", @selenium.get_value("id=cliente_c_postal")
    @selenium.type "id=cliente_sexo", "Femenino"
    assert_equal "Femenino", @selenium.get_value("id=cliente_sexo")
    @selenium.type "id=cliente_fecha_alta", "08/03/2014"
    assert_equal "08/03/2014", @selenium.get_value("id=cliente_fecha_alta")
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
  end
end
