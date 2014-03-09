require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class PruebaModificarSel < Test::Unit::TestCase

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
  
  def test_prueba_modificar_sel
    @driver.get(@base_url + "/")
    @driver.find_element(:xpath, "(//a[contains(text(),'Mostrar')])[2]").click
    @driver.find_element(:link, "Editar").click
    @driver.find_element(:id, "cliente_a_paterno").clear
    @driver.find_element(:id, "cliente_a_paterno").send_keys "hernandez"
    @driver.find_element(:id, "cliente_t_celular").clear
    @driver.find_element(:id, "cliente_t_celular").send_keys "2232323"
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
