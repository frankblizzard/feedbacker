Before do
  # this will run before each scenario
  KeyData.delete_all
end


Given /^I have "([^"]*)" key data with the value of "([^"]*)"$/ do |kd, percent|
  kd.to_i.times do |i|
    KeyData.create!(:name => 'key_data_#{i}', :percentage => percent)
  end
end

When /^I add "([^"]*)" key data with the value of "([^"]*)"$/ do |kd, percent|
  kd.to_i.times do |i|
    KeyData.create!(:name => 'key_data_#{i}', :percentage => percent)
  end
end

Then /^I should have "([^"]*)" key data$/ do |count|
  KeyData.count.should == count.to_i
end

Then /^their combined value should be "([^"]*)"$/ do |sum|
  sum_percentage =  KeyData.all.to_a.sum { |kd| kd.percentage }
  sum_percentage.to_i.should == sum.to_i
end

