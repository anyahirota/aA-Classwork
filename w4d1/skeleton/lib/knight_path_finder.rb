require_relative "00_tree_node"

class KnightPathFinder 
    attr_reader :root_node
    # x y
    MOVES = [
        [-2, -1],
        [-2, 1],
        [-1, 2],
        [-1, -2],
        [2, -1],
        [2, 1],
        [1, -2],
        [1, 2]
    ]

    def inspect 
        "#{@root_node.value}: your children are #{@root_node.children}"
    end 

    def initialize(start_pos) 
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        self.build_move_tree
    end 

    def self.valid_moves(pos) #[5,5] if x or y is over 7 dont include
        possible_moves = []
        
        MOVES.each do |move|
           if (move[0] + pos[0] <= 7 && move[1] + pos[1] <= 7) &&     
                (move[0] + pos[0] >= 0 && move[1] + pos[1] >= 0)
                possible_moves << move 
           end 
        end 
        
        possible_moves
        #arr of positions
        #add 1 to row, add 2 to column 
        #check if on the board 
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        
        possible_moves.map! do |move| 
            x, y = move
            i, j = pos 
            new_x = x + i 
            new_y = y + j 
            move = [new_x, new_y]
        end 

        possible_positions = possible_moves.reject { |pos| @considered_positions.include?(pos)}
        possible_positions.each { |pos| @considered_positions << pos }
        possible_positions
        #find our new_moves 
        #check considered 
        #add new_moves to considered 
    end

    #call this in initialize
    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            el = queue.shift 

            child_positions = self.new_move_positions(el.value)
            child_positions.each do |pos|
                child = PolyTreeNode.new(pos)
                queue << child
                el.add_child(child)
            end 
        end  
        # PolyTreeNode.new(start_pos) # add_child(child_node)
        
    end 

    def find_path(target) #imagining this is a node
        target_node = @root_node.dfs(target)
        return trace_path_back(target_node)
    end 
        
    def trace_path_back(target_node) 
        path = [target_node.value]
        current_node = target_node 
        until path[0] == @root_node.value
            current_node = current_node.parent
            path.unshift(current_node.value)
        end
        path
    end 

end 

# start_pos = root
# possible_pos = children 

# def bfs(target_value)
# 
#         queue = [self]
#         until queue.empty?
#             el = queue.shift
#             return el if el.value == target_value
#             el.children.each {|child| queue << child}
#         end
#     end 

           

           