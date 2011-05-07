require 'rspec'
require 'partition'

describe Partition do

  def create_timings(array)
    ret = []
    array.each_with_index do |e,i|
      ret << [i, e]
    end
    ret
  end

  before(:each) do
    @partition = Partition.new(4)
  end

  it "should be able to just fit in 1" do
    @partition.kb = create_timings([1])
    @partition.subsets.map {|x| x.map(&:last)}.should include [1]
    @partition.subsets.map {|x| x.map(&:last)}.should include []
  end

  it "should do the right thing with a 1..6 range" do
    @partition.kb = create_timings([1,2,3,4,5,6])
    @partition.subsets.map {|x| x.map(&:last)}.should include [6]
    @partition.subsets.map {|x| x.map(&:last)}.should include [5]
    @partition.subsets.map {|x| x.map(&:last)}.should include [4,1]
    @partition.subsets.map {|x| x.map(&:last)}.should include [3,2]
  end

  it "should do the right thing with a 1..7 range" do
    @partition.kb = create_timings([1,2,3,4,5,6,7])
    @partition.subsets.map {|x| x.map(&:last)}.should include [7]
    @partition.subsets.map {|x| x.map(&:last)}.should include [6,1]
    @partition.subsets.map {|x| x.map(&:last)}.should include [5,2]
    @partition.subsets.map {|x| x.map(&:last)}.should include [4,3]
  end

  describe "the optimization capability" do
    describe "of time" do
      describe "calculates the optimum for" do

        it "a single element" do
          @partition.kb = [[1,1]]
          @partition.time_optimal_size.should == 1
        end

        it "an even kb" do
          @partition.kb = create_timings([5,5,5,5])
          @partition.time_optimal_size.should == 4
        end

        it "an extreme kb" do
          @partition.kb = create_timings([5,1,1,1,1])
          @partition.time_optimal_size.should == 2
        end
      end
    end
  end
end
