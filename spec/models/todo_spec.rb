require 'rails_helper'

describe Todo do
  it { is_expected.to have_db_column :name }
  it { is_expected.to validate_presence_of :name }
end