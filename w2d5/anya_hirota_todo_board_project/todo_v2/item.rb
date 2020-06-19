class Item
    attr_accessor :title, :description
    attr_reader :deadline, :tracker

    def self.valid_date?(date_string)
        # arr = [YYYY, MM, DD]
        date_arr = date_string.split("-")
        days = (1..31)
        months = (1..12)
        return true if date_arr.length == 3 && date_arr[0].length == 4 && date_arr[1].length == 2 && date_arr[2].length == 2 && months.include?(date_arr[1].to_i) && days.include?(date_arr[2].to_i)
        false 
    end

    # p Item.valid_date?('2019-10-25') # true
    # p Item.valid_date?('1912-06-23') # true
    # p Item.valid_date?('2018-13-20') # false
    # p Item.valid_date?('2018-12-32') # false
    # p Item.valid_date?('10-25-2019') # false


    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        raise "not valid deadline" if !Item.valid_date?(@deadline)
        @tracker = false #not done
    end 
    
    # p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

    # p Item.new(
    #     'Buy Cheese',
    #     '2019-10-21',
    #     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
    # )

    # p Item.new(
    #     'Fix checkout page',
    #     '10-25-2019',
    #     'The font is too small.'
    # ) # raises error due to invalid date

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline 
        else
            raise "not valid deadline"
        end
    end

    def toggle
        if @tracker == true
            @tracker = false
        else 
            @tracker = true
        end 
    end 

end