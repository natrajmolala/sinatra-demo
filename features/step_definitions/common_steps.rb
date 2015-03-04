When(/^I launch Pet clinic site$/) do
  visit 'http://localhost:4567/home'
end

Then(/^I should see the home page$/) do
  page.has_content?('Welcome')
end

When(/^I navigate to Find owners page$/) do
  click_link('Find owners')
end

Then(/^I should see owners list$/) do
  page.has_content?('Find owners')
end