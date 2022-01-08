
def bubble_sort(array)
  switch = true
  while switch do 
    switch = false
    (1..array.size-1).each do |i|
      if array[i] < array[i-1]
        array[i], array[i-1] = array[i-1], array[i]
        switch = true
      end
    end
  end
  array
end

p bubble_sort([4,3,78,2,0,2])