class Node
    attr_accessor :value, :next
    def initialize(value)
        @value = value
        @next = nil
    end
end

class Stack
    def initialize
        @top = nil
        @bottom = nil
        @length = 0
    end
    def empty?
        @length == 0 ? true : false
    end

    def peek
        return @top.value
    end

    def push(value)
        # return 'empty stack' if @top.empty?
        new_node = Node.new(value)
        if @length == 0
            @top = new_node
            @bottom = new_node
            @length += 1
            @top.value
        else
            @bottom = @top.next
            new_node.next = @top
            @top = new_node
            @length += 1
            new_node.value

            # hold_pointer = @top
            # @top = new_node
            # @top.next = hold_pointer
            
        end       
    end

    def pop
        # return 'empty stack' if @top.empty?
        if @top == @bottom
            @bottom = nil
        end
        @top = @top.next
        @length -= 1
    end

end

stack = Stack.new
stack.push('google')
# p stack.peek
stack.push('udemy')
# p stack.peek
stack.push('discord')

stack.pop
stack.pop
stack.pop
p stack


