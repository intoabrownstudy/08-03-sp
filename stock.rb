# Represents one line-item in the Portfolio.
class Stock
  attr_accessor :company, :symbol, :price_per_share, :currency, :quantity
  
  # Initializes the Stock object.
  #
  # company         - The company String.
  # symbol          - The company's stock symbol String.
  # price_per_share - The Integer value of one share, in cents.
  # currency        - The Symbol of the currency.
  # quantity        - The Integer quantity of shares owned.
  def initialize(company, symbol, price_per_share, currency, quantity)
    @company = company
    @symbol = symbol
    @price_per_share = price_per_share.to_i
    @currency = currency
    @quantity = quantity
  end
  
  # Returns the Integer value of one share in USD.
  def price_in_usd
    case @currency
    when :inr
      @price_per_share.to_i * 50
    when :gbp
      @price_per_share.to_i * 2
    else
      @price_per_share.to_i
    end
  end
  
  # Returns the total Integer value of one stock's shares.
  def total_value
    @quantity * @price_per_share
  end
  
  # Returns the total Integer value of one stock's shares in USD.
  def total_value_usd
    @quantity * price_in_usd
  end
end