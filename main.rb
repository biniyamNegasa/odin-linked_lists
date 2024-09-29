# frozen_string_literal: true

require_relative 'lib/linked_list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.prepend('snake')
list.append('turtle')

puts list
puts list.at(3).val
puts list.remove_at(3)
puts list
puts list.insert_at('pizza', 3)
puts list
puts list.pop.val
puts list
puts list.head.val
puts list
puts list.tail.val
puts list

puts list.pop.val until list.head.nil?
