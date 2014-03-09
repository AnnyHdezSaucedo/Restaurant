require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"
require 'simplecov'
SimpleCov.start

class AltaClientesSel < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :phantomjs
    @base_url = "http://still-meadow-3217.herokuapp.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_alta_clientes_sel
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Crear Cliente").click
    assert !60.times{ break if (element_present?(:id, "cliente_c_targeta_cliente") rescue false); sleep 1 }
    @driver.find_element(:id, "cliente_c_targeta_cliente").clear
    @driver.find_element(:id, "cliente_c_targeta_cliente").send_keys "12345"
    assert_equal "12345", @driver.find_element(:id, "cliente_c_targeta_cliente").attribute("value")
    @driver.find_element(:id, "cliente_nombre").clear
    @driver.find_element(:id, "cliente_nombre").send_keys "Ana Laura"
    assert_equal "Ana Laura", @driver.find_element(:id, "cliente_nombre").attribute("value")
    @driver.find_element(:id, "cliente_a_paterno").clear
    @driver.find_element(:id, "cliente_a_paterno").send_keys "Hernandez"
    assert_equal "Hernandez", @driver.find_element(:id, "cliente_a_paterno").attribute("value")
    @driver.find_element(:id, "cliente_a_materno").clear
    @driver.find_element(:id, "cliente_a_materno").send_keys "Saucedo"
    assert_equal "Saucedo", @driver.find_element(:id, "cliente_a_materno").attribute("value")
    @driver.find_element(:id, "cliente_email").clear
    @driver.find_element(:id, "cliente_email").send_keys "ana_1508@hotmail.com"
    assert_equal "ana_1508@hotmail.com", @driver.find_element(:id, "cliente_email").attribute("value")
    @driver.find_element(:id, "cliente_domicilio").clear
    @driver.find_element(:id, "cliente_domicilio").send_keys "Sauceda de la Borda"
    assert_equal "Sauceda de la Borda", @driver.find_element(:id, "cliente_domicilio").attribute("value")
    @driver.find_element(:id, "cliente_c_postal").clear
    @driver.find_element(:id, "cliente_c_postal").send_keys "98600"
    assert_equal "98600", @driver.find_element(:id, "cliente_c_postal").attribute("value")
    @driver.find_element(:id, "cliente_sexo").clear
    @driver.find_element(:id, "cliente_sexo").send_keys "Femenino"
    assert_equal "Femenino", @driver.find_element(:id, "cliente_sexo").attribute("value")
    @driver.find_element(:id, "cliente_fecha_alta").clear
    @driver.find_element(:id, "cliente_fecha_alta").send_keys "08/03/2014"
    assert_equal "08/03/2014", @driver.find_element(:id, "cliente_fecha_alta").attribute("value")
    @driver.find_element(:name, "commit").click
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
