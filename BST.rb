require 'json'

def traverse(node)
    tree = { value: node.value }
    tree.left = node.left == nil ? nil : traverse(node.left)
    tree.right = node.right == nil ? nil : traverse(node.right)
    return tree
end

class Node
    attr_accessor :value, :right, :left
    def initialize(value)
        @left = nil
        @right = nil
        @value = value
    end
end

class BinarySearchTree
    attr_accessor :root
    def initialize
        @root = nil
    end

    def insert(value)
        new_node = Node.new(value)
        return @root = new_node if @root.nil?
        current_node = @root
        while true
            if value < current_node.value
                if !current_node.left
                    return current_node.left = new_node
                end
                current_node = current_node.left
            else
                if !current_node.right
                    return current_node.right = new_node
                end
                current_node = current_node.right
            end
        end
    end

    def lookup(value)
        return false if !@root
        current_node = @root
        while current_node
            if value < current_node.value
                current_node = current_node.left
            elsif value > current_node.value
                current_node = current_node.right
            elsif current_node.value == value
                return current_node
            end
        end
        return false
    end

    def remove(value)
        to_remove = lookup(value)
        return false if to_remove == false
        if !to_remove.left && !to_remove.right 
            @root = nil
        end
        current_node = @root
        child_node = nil
        child_node2 = nil
        parent_node = nil
        while current_node
            if value < current_node.value
                parent_node = current_node
                current_node = current_node.left
            elsif value > current_node.value
                parent_node = current_node
                current_node = current_node.right
            elsif current_node.value == value
                child_node = current_node.left if current_node.left 
                child_node2 = current_node.right if current_node.right 
                if child_node < child_node2
                    current_node = child_node
                    
                parent_node.left = child_node
                parent_node.right = child_node2
            end
        end
    end
end

tree = BinarySearchTree.new
p tree.insert(9)
p tree
p tree.remove(9)
p tree
# tree.insert(4)
# tree.insert(6)
# tree.insert(20)
# tree.insert(170)
# tree.insert(15)
# tree.insert(1)
# p tree.lookup(3)
p '-------------------------'
# pp tree
# p JSON.stringify(traverse(tree.root))
# p traverse(tree.root)
