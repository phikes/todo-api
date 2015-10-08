require 'rails_helper'

class TestClass; end

describe String do
  describe '#constantize' do
    subject { 'TestClass'.constantize }

    it { is_expected.to eq TestClass }

    context 'plural input' do
      subject { 'test classes'.constantize heuristically: true }

      it { is_expected.to eq TestClass }
    end

    context 'singular input' do
      subject { 'test class'.constantize heuristically: true }

      it { is_expected.to eq TestClass }
    end
  end

  describe '#json' do
    subject { '{ "name": "test" }'.json }

    it { is_expected.to eq("name" => 'test') }
  end
end
