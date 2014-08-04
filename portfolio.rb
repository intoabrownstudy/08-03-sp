# Container for many Stock objects.
class Portfolio
  attr_accessor :stocks
  
  # Initializes the Portfolio object with an empty Array of Stocks.
  def initialize
    @stocks = []
  end
  
  # Add a Stock to the @stocks Array.
  #
  # stock - The Stock object to be added.
  #
  # Returns the new @stocks Array.
  def add_stock(stock)
    @stocks << stock
  end
  
  # Returns the total Integer value of all Stocks.
  def value
    v = 0
    
    @stocks.each do |s|
      v += s.total_value_usd
    end
    
    return v
  end
end