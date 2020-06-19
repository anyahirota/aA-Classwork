require_relative './item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            item = Item.new(title, deadline, description)
            @items << item
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end 

    def valid_index?(index)
        return false if index < 0 || index > self.size - 1
        true
    end 

    def swap(index_1, index_2)
        if !self.valid_index?(index_1) || !self.valid_index?(index_2)
            return false 
        else 
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end 
    end 

    def [](index)
        return nil if !self.valid_index?(index) 
        @items[index] 
    end 

    def priority
        @items[0]
    end 

    def print
        p self.label.upcase
        @items.each_with_index do |item, idx|
            p idx.to_s + " " + item.title + " " + item.deadline + " " + item.tracker.to_s
        end 
    end 

    def print_full_item(index)
        if valid_index?(index)
            puts self[index].title
            puts self[index].description
            puts self[index].deadline
            puts self[index].tracker
        end
    end

    def print_priority
        self.print_full_item(priority)
    end

    def up(index, amount = 1)
        if valid_index?(index)
            item = @items[index]
            amount.times do
                break if @items.index(item) == 0 
                self.swap(@items.index(item), @items.index(item) - 1 )
            end
            return true
        end
        false
    end

    def down(index, amount = 1)
        if valid_index?(index)
            item = @items[index]
            amount.times do
                break if @items.index(item) == @items.length - 1
                self.swap(@items.index(item), @items.index(item) + 1 )
            end
            return true
        end
        false
    end 

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end 

    def toggle_item(index)
        @items[index].toggle
    end 

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end 

    def purge
        new_items = @items.dup
        new_items.each do |item|
            if item.tracker == true
                @items.delete(item)
            end
        end
    end

end