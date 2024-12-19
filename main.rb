require 'byebug'
class KataCalculator

  CUSTOM_DELIMITER_REGEXP = Regexp.new("\/\/(\\D)\\n")
  CUSTOM_LONG_DELIMITER_REGEXP = Regexp.new("\\[(.*?)\\]")
    
  def add(input)
    return 0 if input == ''
    @input = input
    @delimiters = [",","\n"]
    parse_input
    return sum
  end

  private
  def parse_input
    find_delimiters
    get_number_array
    check_numbers_are_positive
    remove_numbers_greater_than
  end

  def get_number_array
    @numbers = @input.split(regexp_for_input).collect(&:to_i)
  end

  def sum
    @numbers.sum
  end

  def regexp_for_input
    Regexp.union(@delimiters)
  end

  def find_delimiters
    if matches = (@input.match(CUSTOM_DELIMITER_REGEXP) || @input.match(CUSTOM_LONG_DELIMITER_REGEXP))
      @delimiters << matches[1]
    end
  end

  def check_numbers_are_positive
    if @numbers.any?(&:negative?)
      negative_numbers = @numbers.select(&:negative?).map(&:to_s).join(",")
      raise "negative numbers not allowed #{negative_numbers}"
    end
  end

  def remove_numbers_greater_than
    @numbers.delete_if{|num| num > 1000}
  end
end


############################ Tests ################################

describe 'KataCalculator' do

  describe "add" do

    before(:each) do
      @calculator = KataCalculator.new
    end

    # Test to Handle Empty String
    it "should return 0 with an empty string" do
      expect(@calculator.add("")).to eql(0)
    end

    # Test to handle single number
    it "should return the number with a number" do
      expect(@calculator.add("5")).to eql(5)
    end

    # Test to handle multiple numbers seperated by comma
    it "should return the sum with 2 or more numbers" do
      expect(@calculator.add('3,2')).to eql(5)
      expect(@calculator.add('1,2,3,4,5')).to eql(15)
    end

    # Test to handle newlines between numbers
    it "should work with the '\\n' delimiter" do
      expect(@calculator.add("3\n2")).to eql(5)
      expect(@calculator.add("1,2\n3")).to eql(6)
    end

    # Test to support custom delimiters
    it "should allow a different delimiter" do
      expect(@calculator.add("//;\n3;2")).to eql(5)
      expect(@calculator.add("//;\n1,2;3")).to eql(6)
      expect(@calculator.add("//;\n1,2;3,5")).to eql(11)
    end

    # Test to check if error is thrown for negative number
    it "should raise an exception if any operand is negative" do
      expect{@calculator.add("-3")}.to raise_error(RuntimeError, "negative numbers not allowed -3")
      expect{@calculator.add("-3, -5")}.to raise_error(RuntimeError, "negative numbers not allowed -3,-5")
      expect{@calculator.add("//;\n-1,2;-3")}.to raise_error(RuntimeError, "negative numbers not allowed -1,-3")
    end

    # Test to check removal of numbers greater than 1000
    it "should ignore numbers bigger than 1000" do
      expect(@calculator.add("1,2,3,1001,2000")).to eql(6)
      expect(@calculator.add("//;\n1,2;3,5000")).to eql(6)
    end

    # Test to check sum with delimiters of any length
    it "should allow delimiters with any length" do
      expect(@calculator.add("//[***]\n1***2***3")).to eql(6)
    end
  end
end