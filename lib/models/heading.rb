class Heading
  attr_reader :records

  def self.load_data(data)
    new(data)
  end

  def generate_numbers
    puts GenerateHeadingWithNumbersService.call(@records)
  end

  private

  def initialize(data)
    @records = data
  end
end
