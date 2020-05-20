require_relative '../lib/services/generate_heading_with_numbers_service.rb'

RSpec.describe GenerateHeadingWithNumbersService do
  subject(:result) do
    GenerateHeadingWithNumbersService.call(headings)
  end

  describe '.call' do
    let(:headings) do
      [
        { "id" => 1, "title" => "heading1", "heading_level" => 0 },
        { "id" => 2, "title" => "heading2", "heading_level" => 2 },
        { "id" => 3, "title" => "heading3", "heading_level" => 1 },
        { "id" => 4, "title" => "heading4", "heading_level" => 1 }
      ]
    end

    it 'should return heading with formatted numbers' do
      expect(result).to be_a_kind_of(String)
    end

    it 'should be equal to 8.00' do
      expect(result).to eq ("heading1\n  1.1.1 heading2\n 1.2 heading3\n 1.3 heading4\n")
    end
  end
end
