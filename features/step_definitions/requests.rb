When(/^the client requests a list of (.*?)$/) do |type|
  get("/#{type.pluralize.downcase.tr(' ', '-')}")
end

When(/^the client requests the creation of a (.*) with the following attributes:$/) do |model, table|
  resource = model.titleize.constantize.new table.rows_hash
  post(polymorphic_path(model.pluralize), model => resource.attributes)
end

Then(/^the response is a list containing (#{CAPTURE_INT}) .+$/) do |count|
  expect(JSON.parse(last_response.body).count).to eq count
end

Then(/^the response is an error$/) do
  expect(last_response.status).to be >= 400
end