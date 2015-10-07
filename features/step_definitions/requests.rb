When(/^the client requests a list of (.*?)$/) do |type|
  get("/#{type.pluralize.downcase.tr(' ', '-')}")
end

Then(/^the response is a list containing (#{CAPTURE_INT}) .+$/) do |count|
  expect(JSON.parse(last_response.body).count).to eq count
end