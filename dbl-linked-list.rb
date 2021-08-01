class Node
    def initialize(value)
        @value = value
        @next = nil
    end
end

class DoublyLinkedList
    def initialize(value)
        @head = {
            value: value,
            prev: nil,
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
                prev: nil,
                next: nil
            }
            new_node[:prev] = @tail
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
                prev: nil,
                next: nil
            }
            new_node[:next] = @head
            @head[:prev] = new_node
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
            next: nil,
            prev: nil
        }
        leader = traverse_index(index-1) # will find the index before the one to be inserted
        follower = leader[:next] # will hold the next so the new element can point at it
        leader[:next] = new_node
        new_node[:prev] = leader
        new_node[:next] = follower
        follower[:prev] = new_node
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
        leader = node[:prev]
        follower = node[:next]
        leader[:next] = follower
        follower[:prev] = leader
        @length -= 1
    end

    def remove_first 
        @head = @head[:next]
        @head[:prev] = nil
        @length -=1
    end

    def remove_last(index)
        new_tail = traverse_index(index -1)
        @tail = new_tail
        new_tail[:next] = nil
        # new_tail[prev] = 
        @length -=1 
    end
end

list = DoublyLinkedList.new(10)
list.append(5)
list.append(16)
list.prepend(1)
list.insert(2, 99)
# # p list.print_all
list.remove(2)
p list.print_all
p list