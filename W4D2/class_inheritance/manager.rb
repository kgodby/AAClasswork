require_relative "employee"

class Manager < Employee
  attr_reader :employees, :salary
  def initialize(name, title, salary, boss = nil)
    @employees = []
    super
  end

  def bonus(multiplier)
    total_salary = self.total_salary
    
    total_salary * multiplier
  end

  def add_emp(emp)
    @employees << emp
  end

  def total_salary
    return self.salary if self.instance_of? Employee
    self.employees.each do |emp|
      result = emp.total_salary
    end
    result
  end
end