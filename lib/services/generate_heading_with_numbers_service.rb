# frozen_string_literal: true
require 'pry'
class GenerateHeadingWithNumbersService
  def initialize(data)
    @headings = data
    @numbers_output = [] # array of array will populate
                        # with number formats like [[1], [1,1], [1,2] ..]
    @temp_array = []
    @output = ''
  end

  def self.call(*args)
    new(*args).perform
  end

  def perform
    @headings.each do |heading|
      last_number_length = @numbers_output.last&.length.to_i
      first_number_length = 1
      heading_position = heading[:heading_level] + 1

      if heading[:heading_level] >= last_number_length
        current_level_gt_prev_level_calc first_number_length, heading_position
      else
        current_level_lt_prev_level_calc heading_position
      end

      @numbers_output << @temp_array
      @output += " " * (@temp_array.length - 1) + @temp_array.join('.') + ' ' + heading[:title] + "\n"
    end
    @output
  rescue StandardError => e
    puts e.message
  end

  private

  def current_level_gt_prev_level_calc(first_number_length, heading_position)
    difference_from_first_level = heading_position - first_number_length
    last_element = @numbers_output.last ? @numbers_output.last.last : 1

    # create number format array by adding the last element of
    # numbers_output array difference_from_first_level times
    @temp_array = [last_element] * difference_from_first_level
    @temp_array += [*1..(heading_position - difference_from_first_level)]
  end

  def current_level_lt_prev_level_calc(heading_position)
    @temp_array = @numbers_output.last.take(heading_position)
    last_element_of_array = @temp_array.pop
    @temp_array.push(last_element_of_array + 1)
  end

end
