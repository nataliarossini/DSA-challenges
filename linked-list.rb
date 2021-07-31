class Node
    def initialize(value)
        @value = value
        @next = nil
    end
end

class LinkedList
    def initialize(value)
        @head = {
            value: value,
            next: nil
        }
        @tail = @head
        @length = 1
    end

    def append(value)
        if @head[:value].nil?
            @head[:value] = value
        else
            new_node = {
                value: value,
                next: nil
            }
            # new_node = Node.new(value)
            @tail[:next] = new_node
            @tail = new_node
            @length += 1
        end
    end

    def prepend(value)
        if @head[:value].nil?
            @head[:value] = value
        else
            new_node = {
                value: value,
                next: nil
            }
            new_node[:next] = @head
            @head = new_node
            @length += 1
        end
    end

    def print_all
        current_node = @head
        all = []
        while current_node
            all << current_node[:value]
            current_node = current_node[:next]
        end
        all
    end

    def insert(index, value)
        return append(value) if index >= @length
        return prepend(value) if index == 0
        new_node = {
            value: value,
            next: nil
        }
        leader = traverse_index(index-1) # will find the index before the one to be inserted
        hold_pointer = leader[:next] # will hold the next so the new element can point at it
        leader[:next] = new_node
        new_node[:next] = hold_pointer
        @length += 1
    end

    def traverse_index(index)
        counter = 0
        current_node = @head
        while counter != index
            current_node = current_node[:next]
            counter += 1
        end
        return current_node
    end

    def remove(index)
        return p 'incorrect index' if index < 0 || index >= @length
        return remove_first if index === 0
        return remove_last(index) if index == @length-1
        node = traverse_index(index)
        leader = traverse_index(index-1)
        leader[:next] = node[:next]
        @length -= 1
    end

    def remove_first 
        @head = @head[:next]
        @length -=1
    end

    def remove_last(index)
        new_tail = traverse_index(index -1)
        @tail = new_tail
        new_tail[:next] = nil
        @length -=1
    end
end

list = LinkedList.new(10)
list.append(5)
list.append(16)
list.prepend(1)
list.insert(2, 44)
# p list.print_all
list.remove(9)
p list.print_all
# p list