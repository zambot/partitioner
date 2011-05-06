class Array
  def value_sum
    self.inject(0) {|a,b| a+b.last}
  end

  def sum
    self.inject(0) {|a,b| a+b}
  end
end

class Partition
  attr_accessor :kb, :bucket_count
  def initialize(bucket_count)
    @kb = {}
    @bucket_count = bucket_count
    @buckets = Array.new(bucket_count) {[]}
    @prepared = false
  end

  def smallest_bucket
    candidate ||= @buckets.min {|a,b| a.map(&:last).sum <=> b.map(&:last).sum}
    candidate
  end

  def fill_buckets
    kb = @kb.dup
    kb = kb.sort_by {|x| x.last}.reverse

    while !kb.empty?
      smallest_bucket << kb.shift
    end
    @prepared = true
  end

  def subsets
    fill_buckets unless @prepared
    @buckets
  end

end
