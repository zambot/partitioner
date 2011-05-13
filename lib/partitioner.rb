require 'bucket'
class Partition
  attr_accessor :kb, :bucket_count
  def initialize(bucket_count)
    @kb = {}
    @bucket_count = bucket_count
    @buckets = Array.new(bucket_count) {Bucket.new}
    @prepared = false
  end

  def buckets
    fill_buckets unless @prepared
    @buckets
  end
  alias subsets buckets

  def smallest_bucket
    cadidate = @buckets.detect(&:empty?)
    candidate ||= @buckets.min {|a,b| a.value_sum <=> b.value_sum}
    candidate
  end

  def biggest_bucket
    @buckets.max {|a,b| a.value_sum <=> b.value_sum}
  end

  def fill_buckets
    kb = @kb.dup
    kb = kb.sort_by {|x| x.last}.reverse

    while !kb.empty?
      smallest_bucket << kb.shift
    end
    @prepared = true
  end

  def reset!
    @buckets = Array.new(@bucket_count) { Bucket.new }
    @prepared = false
  end

  # optimizes the bucketsize for time
  # takes the longest critical path (biggest task)
  # and calculates the amount of buckets of equal size
  # needed that all other tasks can fit in them
  def time_optimal_size
    total_time = kb.inject(0){|a,b| a+b.last}
    (total_time / kb.map(&:last).max.to_f).ceil
  end

  def time_optimal_size!
    @bucket_count = time_optimal_size
  end

end
