
class Employee
    attr_reader :name, :title, :salary

    def initialize (name, title, salary)
        @name = name
        @title = title
        @salary = salary
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :staff
    def initialize (name, title, salary)
        super(name, title, salary)
        @staff = []

    end

    def add_staff(staff)
        self.staff << staff
    end

    def bonus(multiplier)
        total_sal = 0
        @staff.each {|s| total_sal += s.salary}
        bonus = total_sal * multiplier
        bonus
    end


end

