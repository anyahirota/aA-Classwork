require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries_hash)
        @name = name
        @funding = funding
        @salaries = salaries_hash
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end 

    def >(another_startup)
        return true if self.funding > another_startup.funding 
        false
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise "Not valid title" 
        else 
            @employees << Employee.new(employee_name, title) 
        end
    end 

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @salaries[employee.title] < @funding
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "not enough funds"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)} 
    end

    def average_salary
        count = 0
        @employees.each do |employee|
            count += @salaries[employee.title]
        end 
        count / @employees.length
    end

    def close
        @employees = []
        @funding = 0 
    end 

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |k,v| 
           if !@salaries.has_key?(k)
            @salaries[k] = v
           end 
        end 
        @employees += other_startup.employees
        other_startup.close
    end 




end
