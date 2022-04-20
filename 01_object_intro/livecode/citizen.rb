class Citizen
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def can_vote?
    @age >= 18
  end

  def full_name
    "#{@first_name.strip.capitalize} #{@last_name.strip.upcase}"
  end

  private

  def titleize(string)
    return nil if string.nil?

    string.split(" ").map(:&capitalize)
  end
end
