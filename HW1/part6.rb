class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?
    formatted_string = self.downcase.gsub(/[^0-9A-Za-z_\s]/, '').delete(" ")
    formatted_string.reverse == formatted_string    
  end
end

module Enumerable
  def palindrome?
    array = self.to_a
    array == array.reverse
  end
end


## TEST CODE ##
#print "a man a plan a canal panama".palindrome?
#print ["a", "b", "c", "b", "a"].reverse