require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class PruebaInsercionSel < Test::Unit::TestCase

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
  
  def test_prueba_insercion_sel
    @driver.get(@base_url + "/clientes")
    @driver.find_element(:link, "Crear Cliente").click
    assert element_present?(:id, "cliente_c_targeta_cliente")
    assert element_present?(:id, "cliente_c_targeta_cliente")
    @driver.find_element(:id, "cliente_c_targeta_cliente").clear
    @driver.find_element(:id, "cliente_c_targeta_cliente").send_keys "111112"
    @driver.find_element(:id, "cliente_nombre").clear
    @driver.find_element(:id, "cliente_nombre").send_keys "cony"
    @driver.find_element(:id, "cliente_a_paterno").clear
    @driver.find_element(:id, "cliente_a_paterno").send_keys "salazar"
    @driver.find_element(:id, "cliente_a_materno").clear
    @driver.find_element(:id, "cliente_a_materno").send_keys "saucedo"
    assert element_present?(:id, "cliente_c_targeta_cliente")
    @driver.find_element(:id, "cliente_email").clear
    @driver.find_element(:id, "cliente_email").send_keys "conyhs.04@gmail.com"
    @driver.find_element(:id, "cliente_t_celular").clear
    @driver.find_element(:id, "cliente_t_celular").send_keys "11111111"
    @driver.find_element(:id, "cliente_domicilio").clear
    @driver.find_element(:id, "cliente_domicilio").send_keys "sauceda"
    @driver.find_element(:id, "cliente_c_postal").clear
    @driver.find_element(:id, "cliente_c_postal").send_keys "98140"
    @driver.find_element(:id, "cliente_sexo").clear
    @driver.find_element(:id, "cliente_sexo").send_keys "femenino"
    @driver.find_element(:id, "cliente_fecha_alta").clear
    @driver.find_element(:id, "cliente_fecha_alta").send_keys "4/03/2014"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:link, "Volver").click
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
