class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    def parent=(node)
        if @parent != nil
            @parent.children.delete(self)
        end
        @parent = node
        node.children << self if node != nil
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise "not a child" if node.parent == nil
        node.parent = nil
    end

    def dfs(target)
        return self if @value == target
        @children.each do |child| 
            s = child.dfs(target)
            return s if s
        end
        nil
    end

    def bfs(target)
        que = [self]
        until que.empty?
            node = que.shift
            return node if node.value == target
            que += node.children
        end
    end


end