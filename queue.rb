class Node
    attr_accessor :value, :next
    def initialize(value)
        @value = value
        @next = nil
    end
end

class Queue
    def initialize
        @first = nil
        @last = nil
        @length = 0
    end

    def peek
        return @first
    end

    def enqueue(value)
        new_node = Node.new(value)
        if @length == 0
            @first = new_node
            @last = new_node
            @length += 1
        else
            @last.next = new_node
            @last = new_node
            @length += 1
        end
        
    end

    def dequeue
        if @first.nil?
            return nil
        end
        if @first == @last
            @last = null
        end
        @first = @first.next
        @length -= 1
    end

end

queue = Queue.new
queue.enqueue('joy')
queue.enqueue('matt')
queue.enqueue('pavel')
queue.enqueue('samir')
p queue
queue.dequeue
p queue.peek
