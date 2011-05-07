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
    candidate ||= @buckets.min {|a,b| a.map(&:last).sum <=> b.map(&:last).sum}
    cadidate = @buckets.detect(&:empty?)
    candidate ||= @buckets.min {|a,b| a.value_sum <=> b.value_sum}
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
