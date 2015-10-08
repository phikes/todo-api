Given(/^the system knows about the following (.*):$/) do |model, table|
  table.hashes.each do |attributes|
    model.constantize(heuristically: true).create attributes
  end
end

Then(/^(#{CAPTURE_INT}) .* has the following attributes:$/) do |count, table|
  items = JSON.parse last_response.body

  matched_items = items.select do |item|
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
  expect(JSON.parse last_response.body).to include table.rows_hash
end