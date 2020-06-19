#@value 
#@up "1 or 0"
#getters for up 
#instance methods: 
#hide, reveal, to_s, ==

class Card
    attr_accessor :up, :value

    def initialize(char)
        @value = char 
        @up = false 
    end 

    def hide
        @up = 0
    end 

    def reveal
        @up = 1
    end 

    def ==(card_instance)
        @value == card_instance.value
    end 

end 