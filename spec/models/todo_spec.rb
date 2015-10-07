require 'rails_helper'

describe Todo do
  it { should have_db_column :name }
end