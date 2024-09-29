# frozen_string_literal: true

# A linked list node
class Node
  attr_accessor :val, :prev, :next

  def initialize(val = nil, prev = nil, nxt = nil)
    @val = val
    @prev = prev
    @next = nxt
  end
end

# linked list
class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    @size += 1
    if @tail.nil?
      @tail = node
      @head = node
    else
      node.prev = @tail
      @tail.next = node
      @tail = @tail.next
    end
  end

  def prepend(value)
    node = Node.new(value)
    @size += 1
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head.prev = node
      @head = @head.prev
    end
  end

  attr_reader :size, :head, :tail

  def at(index)
    return nil if index.negative? || index >= size

    middle = size / 2
    if index <= middle
      current = head
      count = 0
      until count == index
        current = current.next
        count += 1
      end
    else
      current = tail
      count = size - 1
      until count == index
        current = current.prev
        count -= 1
      end
    end
    current
  end

  def pop
    return if @tail.nil?

    @size -= 1
    popped = @tail
    @tail = @tail.prev
    if size.zero?
      @head = nil
    else
      @tail.next = nil
    end
    popped.prev = nil
    popped
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.val == value

      current = current.next
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.val == value

      current = current.next
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    return if index.negative? || index > size

    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      place = at(index)
      previous = place.prev
      node = Node.new(value)

      previous.next = node
      node.next = place
      place.prev = node
      node.prev = previous
      @size += 1
    end
  end

  def remove_at(index)
    return nil if index.negative? || index >= size

    if index.zero?
      @head = @head.next
      if size == 1
        @tail = nil
      else
        @head.prev = nil
      end
    elsif index == size - 1
      @tail = @tail.prev
      if size == 1
        @head = nil
      else
        @tail.next = nil
      end
    else
      current = at(index)
      previous = current.prev
      nxt = current.next
      previous.next = nxt
      nxt.prev = previous
    end
    @size -= 1
    nil
  end

  def to_s
    current = @head
    array = []
    until current.nil?
      array << "( #{current.val} ) -> "
      current = current.next
    end
    array << 'nil'
    array.join
  end
end
