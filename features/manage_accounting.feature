Feature: Accountant manages key data
  In order to run my business
  As an accountant
  I need to be able to manage my key data
  
  
  Scenario: Accountant adds key data
  
  Given I have "1" key data with the value of "70"
  When I add "1" key data with the value of "40"
  Then I should have "2" key data
  And their combined value should be "110"
  
  
  
  Scenario: Accountant changes hourly rate
  
  
  
  
  Scenario: Accountant checks project and sees financial information
  
  
  
  Scenario: Normal user does not see accounting information
  
  
  
  
  Scenario: Normal user does not see hourly rates
  
  
  
  Scenario: Normal user checks project and does not see financial information