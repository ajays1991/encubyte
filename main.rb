class KataCalculator
    
  def add(input)
    return 0 if input == ''
    return input.to_i
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
  end
end