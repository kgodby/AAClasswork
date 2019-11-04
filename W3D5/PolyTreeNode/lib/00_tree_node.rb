require "byebug"

class PolyTreeNode

    attr_reader :parent, :value, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) if @parent
        @parent = node
        node.children << self if !node.nil?
    end
    
    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise error if !children.include?(node)
        node.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child| 
            cur_node = child.dfs(target)
            return cur_node if !cur_node.nil? 
        end
        return nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            cur_node = queue.shift
            return cur_node if cur_node.value == target
            cur_node.children.each { |child| queue << child }
        end
        return nil
    end

end