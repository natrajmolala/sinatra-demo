When(/^I launch Pet clinic site$/) do
  visit 'http://localhost:4567/home'
end

Then(/^I should see the home page$/) do
  page.has_content?('Welcome')
end

When(/^I navigate to Find owners page$/) do
  click_link('Find owners')
end

Then(/^I should see option to find owners$/) do
  page.has_content?('Find owners')
  find_field('last-name-text').value
  find_button('Find owner')
end

When(/^I navigate to Veterinaries page$/) do
  click_link('Veterinaries')
end

Then(/^I should see Veterinaries list$/) do
  page.has_content?('Vers home')
end