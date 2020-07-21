=begin
Implement a method #stock_picker that takes in an array of stock prices,
one for each hypothetical day. It should return a pair of days representing
the best day to buy and the best day to sell. Days start at 0.
=end

def stock_picker(array)
  profits = {}
  array.each do |stock|
    buy_idx = array.index(stock)
    array.each do |next_stock|
      sell_idx = array.index(next_stock)
      if buy_idx < sell_idx
        profits["#{stock}->#{next_stock}"] = next_stock - stock
      end
    end
  end
  max_profit_pair = profits.max_by { |k,v| v }
  final_result = max_profit_pair[0].split('->')
  day_to_buy = array.index(final_result[0].to_i)
  day_to_sell = array.index(final_result[1].to_i)
  p ary = [day_to_buy, day_to_sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1, 4]
stock_picker([2,5,3,10,9,8,15,1,6,17])
# => [7, 9]
stock_picker([14,3,17,8,10,12,23,2,5])
# => [1, 6]