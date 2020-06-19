require_relative "./list.rb"
require_relative "./item.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end 

    def get_command
        puts "Enter a command"
        puts "Possible commands (arguments separated with spaces): \n
        mktodo <title> <deadline> <optional description> \n
        up <index> <optional amount> \n
        down <index> <optional amount> \n
        swap <index_1> <index_2> \n
        sort \n
        priority \n
        print <optional index> \n
        quit"
        cmd, *args = gets.chomp.split(" ")
        case cmd
        when 'mktodo'
            @list.add_item(*args)
            return true
        when 'up'
            @list.up(*args.map {|el| el.to_i})
            return true
        when 'down'
            @list.down(*args.map {|el| el.to_i})
            return true
        when 'swap'
            @list.swap(*args.map {|el| el.to_i} )
            return true
        when 'sort'
            @list.sort_by_date!
            return true
        when 'priority'
            @list.print_priority
            return true
        when 'print'
            if args.empty?
                @list.print
            else
                @list.print_full_item(*args.map {|el| el.to_i})
            end
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