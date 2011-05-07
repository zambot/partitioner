class Partition
  class Bucket < Array
    def value_sum
      self.inject(0) {|a,b| a+b.last}
    end
  end
end
