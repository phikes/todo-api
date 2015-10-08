Given(/^the system knows about the following (.*):$/) do |model, table|
  table.hashes.each do |attributes|
    model.constantize(heuristically: true).create attributes
  end
end