When(/^the client requests a list of (.*?)$/) do |model|
  get polymorphic_path(model.pluralize)
end

When(/^the client requests the creation of a (.*) with the following attributes:$/) do |model, table|
  resource = model.titleize.constantize.new table.rows_hash
  post(polymorphic_path(model.pluralize), model => resource.attributes)
end

When(/^the client requests deletion of the first (.*)$/) do |model|
  first_id = model.titleize.constantize.first.id
  delete polymorphic_path(model, id: first_id)
end

Then(/^the response is a list containing (#{CAPTURE_INT}) .+$/) do |count|
  expect(JSON.parse(last_response.body).count).to eq count
end

Then(/^the response is an error$/) do
  expect(last_response.status).to be >= 400
end

Then(/^the error contains the following attributes:$/) do |table|
  response = JSON.parse last_response.body

  table.rows_hash.each do |(key, value)|
    expect(response[key]).to include value
  end
end