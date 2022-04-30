class Recipe
  attr_reader :name, :description, :rating, :status, :prep_time

  def initialize(name, description, rating, status = false, prep_time)
    @name = name
    @description = description
    @rating = rating
    @status = status
    @prep_time = prep_time
  end

  def done!
    @status = true
  end
end
