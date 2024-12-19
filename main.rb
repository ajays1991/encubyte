require 'byebug'
class KataCalculator
    
  def add(input)
    return 0 if input == ''
    @input = input
    parse_input
    return sum
  end

  private
  def parse_input
    get_number_array
  end

  def get_number_array
    @numbers = @input.split(",").map(&:to_i)
  end

  def sum
    @numbers.sum
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
  end
end