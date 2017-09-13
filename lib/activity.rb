require 'pry'
class Activity

  attr_reader :name_of_activity, :participants

  def initialize(name_of_activity)
    @name_of_activity = name_of_activity
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid.to_i
  end

  def total_cost
    @participants.values.reduce(:+)
  end

  def split_cost
    amount_of_participants = @participants.count
    total_cost / amount_of_participants
  end

  def balance(name)
    if split_cost > @participants[name]
      puts "x"
    elsif split_cost < @participants[name]
      puts "y"
    end
  end

end
# binding.pry
