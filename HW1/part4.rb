class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  ##Old fashion method for getting/setting in class, use attr_accessor etc
  def name
    @name
  end
  def name=(new_name)
    @name = new_name
  end

  def calories
    @calories
  end
  def calories=(new_calories)
    @calories = new_calories
  end
  
  def healthy?
    @calories < 200
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  attr_accessor :flavor
  
  def delicious?
    if @flavor == "black licorice"
      return false      
    end
    return true
  end
end
