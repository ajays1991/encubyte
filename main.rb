class KataCalculator
    
  def add(input)
    return 0 if input == ''
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
      @calculator.add("").should == 0
    end
  end
end