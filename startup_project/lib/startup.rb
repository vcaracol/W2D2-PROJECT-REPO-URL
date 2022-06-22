require "employee"
class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another)
        self.funding > another.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment = @salaries[employee.title]
        if @funding >= payment
            employee.pay(payment)
            @funding -= payment
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end
end
