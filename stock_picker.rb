=begin
Implement a method #stock_picker that takes in an array of stock prices,
one for each hypothetical day. It should return a pair of days representing
the best day to buy and the best day to sell. Days start at 0.
=end

def stock_picker(array)
  best_days = []
  max_profit = 0
  array.each do |buy|
    buy_idx = array.index(buy)
    array.each do |sell|
      sell_idx = array.index(sell)
      if buy_idx < sell_idx
        profit = sell - buy
        if profit > max_profit
          max_profit = profit
          best_days = [buy_idx, sell_idx]
        end
      end
    end
  end
  p best_days
end

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1, 4]
stock_picker([2,5,3,10,9,8,15,1,6,17])
# => [7, 9]
stock_picker([14,3,17,8,10,12,23,2,5])
# => [1, 6]