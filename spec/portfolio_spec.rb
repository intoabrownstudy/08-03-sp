require "spec_helper" # this lets us run tests
require_relative "../portfolio.rb"
require_relative "../stock.rb"

describe Portfolio do
  it "should initialize an empty array of stocks" do
    p = Portfolio.new
    expect(p.stocks).to eql([])
  end
  
  it "should add a stock to its set of stocks" do
    p = Portfolio.new
    s = Stock.new("Apple", "AAPL", 4000, :usd, 50)
    p.add_stock(s)
    
    expect(p.stocks).to include(s)
  end
  
  it "should return the total value" do
    p = Portfolio.new
    s1 = Stock.new("Apple", "AAPL", 4000, :usd, 50)
    s2 = Stock.new("Microsoft", "MSFT", 2000, :usd, 400)
    p.add_stock(s1)
    p.add_stock(s2)
    
    total_value_expected = (4000 * 50) + (2000 * 400)
    
    expect(p.value).to eql(total_value_expected)
  end
  
  it "should return the total value, even when stocks are not USD currency" do
    p = Portfolio.new
    s1 = Stock.new("Apple", "AAPL", 2000, :gbp, 30)
    s2 = Stock.new("Microsoft", "MSFT", 2000, :usd, 400)
    s3 = Stock.new("IBM", "IBM", 500, :inr, 100)
    p.add_stock(s1)
    p.add_stock(s2)
    p.add_stock(s3)
    
    total_value_expected = (4000 * 30) + (2000 * 400) + (25000 * 100)
    
    expect(p.value).to eql(total_value_expected)
  end
end