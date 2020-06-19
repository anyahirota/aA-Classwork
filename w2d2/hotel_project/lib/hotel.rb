require_relative "room"

class Hotel

    attr_reader :rooms
    
    def initialize(name, hash)
        @name = name
        @rooms = {} 

        hash.each do |room,capacity|
            @rooms[room] = Room.new(capacity)
        end
    end 

    def name
        capitalized_name = @name.split(' ').map { |name| name.capitalize }
        capitalized_name.join(' ')
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name) 
            return true
        else 
            false
        end
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else 
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else 
                p "sorry, room is full"
            end 
        end 
    end

    def has_vacancy?
        @rooms.each do |room, capacity|
            return true if !capacity.full?
        end

        false
    end

    def list_rooms
        @rooms.each do |room, capacity|
            puts room + " " + capacity.available_space.to_s 
        end 
    end 


    
end
