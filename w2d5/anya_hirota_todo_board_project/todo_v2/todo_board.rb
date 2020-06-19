require_relative "./list.rb"
require_relative "./item.rb"

class TodoBoard

    def initialize #(label)
        @lists = {} #Hash.new {|h, label| h[label] = List.new(label)}
    end 

    def get_command
        puts "Enter a command"
        puts "Possible commands (arguments separated with spaces): \n
        mklist <new_list_label> \n
        ls \n
        showall \n
        mktodo <list_label> <title> <deadline> <optional description> \n
        up <list_label> <index> <optional amount> \n
        down <list_label> <index> <optional amount> \n
        swap <list_label> <index_1> <index_2> \n
        sort <list_label> \n
        priority <list_label> \n
        print <list_label> <optional index> \n
        toggle <list_label> <index> \n
        rm <list_label> <index> \n
        purge <list_label> \n
        quit"
        cmd, label, *args = gets.chomp.split(" ")
        case cmd
        when 'mklist'
            @lists[label] = List.new(label)
            return true
        when 'ls'
            @lists.each {|k, v| puts k}
            return true 
        when 'showall'
            @lists.each {|k, v| v.print}
            return true
        when 'mktodo'
            @lists[label].add_item(*args)
            return true
        when 'up'
            @lists[label].up(*args.map {|el| el.to_i})
            return true
        when 'down'
            @lists[label].down(*args.map {|el| el.to_i})
            return true
        when 'swap'
            @lists[label].swap(*args.map {|el| el.to_i} )
            return true
        when 'sort'
            @lists[label].sort_by_date!
            return true
        when 'priority'
            @lists[label].print_priority
            return true
        when 'print'
            if args.empty?
                @lists[label].print
            else
                @lists[label].print_full_item(*args.map {|el| el.to_i})
            end
            return true
        when 'toggle'
            @lists[label].toggle_item(*args.map {|el| el.to_i})
            return true
        when 'rm'
            @lists[label].remove_item(*args.map {|el| el.to_i})
            return true
        when 'purge'
            @lists[label].purge
            return true
        when 'quit'
            return false
        else 
            print "Sorry, that command is not recognized."
        end

    end 

    def run
        self.get_command until self.get_command == false
    end 
end 





todo_board = TodoBoard.new
todo_board.run