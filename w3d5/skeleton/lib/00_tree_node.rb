require "byebug"
class PolyTreeNode

    attr_reader :parent, :value, :children

    def initialize(value)
        @value = value
        @parent = nil #instance1
        @children = []
    end 

    def inspect
        "@value= #{@value}, @parent= #{@parent}, @children= #{@children} "
    end 


    def parent=(node) #b.value = value 
        if !@parent.nil? 
            @parent.children.reject! { |child| child == self }
        end 
        @parent = node #parent = b ; self  value  self.parent=(value) ; 
        if !@parent.nil?
            if !@parent.children.include?(self) 
                    @parent.children << self 
            end 
        end
    end 

    def add_child(child_node)
        child_node.parent = self 
    end 
    
    def remove_child(child_node)
        raise "not a child" if !self.children.include?(child_node)
        child_node.parent = nil
    end  

    def dfs(target_value)

    end 

    def bfs(target_value)

    end 

    
    
    #self.parent = 
    #if parent is not equal to nil(there is a parent) before we 
    #reset the parent, we need to remove self from that parent's.children 
end

#self g
#old parent is c.children = []
#new_parent b b.childre = [g]