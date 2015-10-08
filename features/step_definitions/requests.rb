When(/^the client requests a list of (.*?)$/) do |model|
  get polymorphic_path(model.pluralize)
end

When(/^the client requests the creation of a (.*) with the following attributes:$/) do |model, table|
  resource = model.constantize(heuristically: true).new table.rows_hash
  post polymorphic_path(model.pluralize), model => resource.attributes
end

When(/^the client requests deletion of the first (.*)$/) do |model|
  first_id = model.constantize(heuristically: true).first.id
  delete polymorphic_path(model, id: first_id)
end