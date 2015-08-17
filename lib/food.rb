class Food
  attr_reader(:type, :cost, :rating, :id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @cost = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_foods = DB.exec("SELECT * FROM food;")
    foods = []
    returned_foods.each() do |food|
      type = food.fetch("type")
      cost = food.fetch("cost")
      rating = food.fetch("rating")
      id = food.fetch("id").to_i()
      foods.push(Food.new({:type => type, :cost => cost, :rating => rating, :id => id}))
    end
    foods
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO food (type, cost, rating) VALUES ('#{@type}', #{@cost}, #{@rating}) RETURNING id")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_food|
    self.id()==another_food.id()
  end
end
