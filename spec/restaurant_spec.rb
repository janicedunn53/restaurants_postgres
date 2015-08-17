require('spec_helper')

describe(Restaurant) do
  describe(".all") do
    it('starts off with no list') do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('returns the name of the restaurant') do
      restaurant = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      expect(restaurant.name()).to(eq("Janices Restaurant"))
    end
  end

  describe('#location') do
    it('returns the location of the restaurant') do
      restaurant = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      expect(restaurant.location()).to(eq("Portland"))
    end
  end

  describe('#phone') do
    it('returns the phone number of the restaurant') do
      restaurant = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      expect(restaurant.phone()).to(eq("5035551234"))
    end
  end

  describe('#id') do
    it ('returns the id of the restaurant') do
      restaurant = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      restaurant.save()
      expect(restaurant.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('lets you save a restaurant to the database') do
      restaurant = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      restaurant.save()
      expect(Restaurant.all()).to(eq([restaurant]))
    end
  end

  describe('#==') do
    it('is the same restaurant if it has the same name') do
      restaurant1 = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      restaurant2 = Restaurant.new({:name => "Janices Restaurant", :location => "Portland", :phone => "5035551234", :id => nil})
      expect(restaurant1).to(eq(restaurant2))
    end
  end
end
