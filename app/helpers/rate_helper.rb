module RateHelper
  def get_rate(rate)
    rate.nil? ? Rate.new : rate
  end
end
