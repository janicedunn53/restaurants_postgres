require('spec_helper')

describe(Food) do
  describe(".all") do
    it("starts off with no food") do
      expect(Food.all()).to(eq([]))
    end
  end

  describe("#type") do
    it("tell you its type") do
      food = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      expect(food.type()).to(eq("sandwich"))
    end
  end

  describe('#cost') do
    it("tells you the cost of the food") do
      food = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      expect(food.cost()).to(eq(2.00))
    end
  end

  describe('#rating') do
    it('tells you the rating of the food') do
      food = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      expect(food.rating()).to(eq(4))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      food = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      food.save()
      expect(food.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save food to the database") do
      food = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      food.save()
      expect(Food.all()).to(eq([food]))
    end
  end

  describe("#==") do
    it("is thesame food if it has the same name") do
      food1 = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      food2 = Food.new({:type => "sandwich", :cost => 2.00, :rating => 4, :id => nil})
      expect(food1).to(eq(food2))
    end
  end
end
