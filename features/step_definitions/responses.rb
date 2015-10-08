Then(/^(#{CAPTURE_INT}) .* has the following attributes:$/) do |count, table|
  matched_items = last_response.body.json.select do |item|
    table.hashes.inject(true) do |match, row|
      attribute, expected_type, expected_value = row[:attribute], row[:type], row[:value]
      actual_value = item[attribute]

      match &&
        actual_value.kind_of?(expected_type.constantize) &&
        actual_value == expected_value
    end
  end

  expect(matched_items.count).to eq count
end

Then(/^the response is a .* with the following attributes:$/) do |table|
  expect(last_response.body.json).to include table.rows_hash
end

Then(/^the response is a list containing (#{CAPTURE_INT}) .+$/) do |count|
  expect(last_response.body.json.count).to eq count
end

Then(/^the response is an error$/) do
  expect(last_response.status).to be >= 400
end

Then(/^the response contains the following attributes:$/) do |table|
  table.rows_hash.each do |(attribute, value)|
    expect(last_response.body.json[attribute]).to include value
  end
end