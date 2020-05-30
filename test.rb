require_relative 'linked_list'

my_list = LinkedList.new
puts "New List: "
p my_list

rand(1..20).times do
  my_list.append(rand(1..100))
end
puts "Append Numbers: #{my_list}"

my_list.prepend(rand(1..100))
puts "Prepend Number: #{my_list}"

puts "Head: "
p my_list.head
puts "Tail: "
p my_list.tail

rand_num = rand(1..100)
puts "Contains #{rand_num}?: #{my_list.contains?(rand_num)}"

my_list.insert_at(4,2)
puts "Insert at(4,2): #{my_list}"

my_list.remove_at(1)
puts "Remove at(1): #{my_list}"

puts "Size: #{my_list.size}"

puts "To String: #{my_list.to_s}"