
def stock_picker(arr)
  accumulator = 0
  indices = [0,0]
  (0..arr.size-1).each do |i|
    (i..arr.size-1).each do |j|
      if arr[j] - arr[i] > accumulator
        accumulator = arr[j]-arr[i]
        indices = [i,j]
      end
    end
  end
  indices
end

p stock_picker([17,3,6,9,15,8,6,1,10])