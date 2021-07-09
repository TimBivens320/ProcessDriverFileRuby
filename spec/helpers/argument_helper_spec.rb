require_relative "../../helpers/argument_helper.rb"

include ArgumentHelper

RSpec.describe ArgumentHelper do
    it 'calls has_invalid_arguments with valid arguments' do
      expect(ArgumentHelper.has_invalid_arguments(['arg0'])).to eq(false)
    end

    it 'calls has_invalid_arguments with no arguments' do
      expect(ArgumentHelper.has_invalid_arguments([])).to eq(true)
    end

    it 'calls has_invalid_arguments with too many arguments' do
      expect(ArgumentHelper.has_invalid_arguments(['arg0', 'arg1'])).to eq(true)
    end

    it 'calls should_display_help with help option' do
      expect(ArgumentHelper.should_display_help(['-?'])).to eq(true)
    end

    it 'calls should_display_help without help option' do
      expect(ArgumentHelper.should_display_help(['arg0'])).to eq(false)
    end

    it 'calls get_filename' do
      expect(ArgumentHelper.get_filename(['filename.txt', 'unknown'])).to eq('filename.txt')
    end
end
