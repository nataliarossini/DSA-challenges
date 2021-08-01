class Stack
    def initialize
        @array = []
    end

    def peek
        return @array[-1]
    end

    def push(value)
        @array << value     
    end

    def pop
        @array.pop
    end

end

stack = Stack.new
stack.push('google')
# p stack.peek
stack.push('udemy')
# p stack.peek
stack.push('discord')

# stack.pop
# stack.pop
# stack.pop
p stack.peek
p stack


