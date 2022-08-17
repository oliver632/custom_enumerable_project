module Enumerable
  def my_each_with_index
    if block_given?
      index_position = 0
      for x in self do
        yield(x, index_position)
        index_position += 1
      end
    else
      puts 'No block given'
    end
  end

  def my_select(&block)
    return_array = []
    self.my_each do |item|
      return_array << item if block.call(item)
    end
    return_array
  end

  # returns true or false depending on if all values are true to the block given
  def my_all?(&block)
    self.my_each do |item|
      return false unless block.call(item)
    end
    true
  end

  def my_any?(&block)

    self.my_each do |item|
      return true if block.call(item)
    end
    false
  end

  def my_none?(&block)
    self.my_each do |item|
      return false if block.call(item)
    end
    true
  end

  def my_count(&block)
    my_count = 0
    if block_given?
      self.my_each do |item|
        my_count += 1 if block.call(item)
      end
    else
      for item in self do 
        my_count +=1
      end
    end
    my_count
  end

  def my_map(&block)
    return_array = []
    self.my_each do |item|
      return_array << block.call(item)
    end
    return_array
  end

  def my_inject(initial_value, &block)
    value = initial_value
    self.my_each do |item|
      value = block.call(value, item)
    end
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  def my_each
    if block_given?
      for x in self do
        yield(x)
      end
    else
      puts 'No block given'
    end
  end
end
