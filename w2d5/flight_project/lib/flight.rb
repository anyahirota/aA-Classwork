require_relative "./passenger.rb"

class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end 

    def full?
        return true if @passengers.length >= @capacity
        false 
    end

    def board_passenger(passenger)
        if !self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end 
        end 
    end 

    def list_passengers
        passenger_names = []
        @passengers.each { |p| passenger_names << p.name}
        passenger_names
    end 

    def [](idx)
        @passengers[idx]        
    end 

    def <<(passenger)
        self.board_passenger(passenger)
    end 


end 