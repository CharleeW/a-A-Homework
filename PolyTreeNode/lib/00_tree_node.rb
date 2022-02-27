class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        @parent.children.delete(self) if @parent != nil
        @parent = node
        @parent.children << self if node != nil && !@parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Not a child" if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target_value)
        return nil if self.nil?
        return self if self.value == target_value

        self.children.each do |child|
            search_results = child.dfs(target_value)
            return search_results if search_results
        end
        nil
    end

    def bfs(target_value)
        search_queue = [self]
        until search_queue.empty?
            node = search_queue.shift
            return node if node.value == target_value
            search_queue += node.children
        end
        nil
    end



end