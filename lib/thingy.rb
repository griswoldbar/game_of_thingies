class Thingy
  @@features = [:appeal, :diet, :speed, :strength, :intelligence]
  
  attr_writer *@@features, :location
  
  @@features.each do |feature|
    class_eval "
      def #{feature}
        @#{feature} ||= rand(10)
      end
    "
  end
  
  def self.features
    @@features
  end
  
  
  def initialize(options={})
    options.each {|k,v| send("#{k}=",v)}
  end
  
  
  def breed(mate)
    
  end
  
  def fight(opponent)
  
  end
  
  def eat(food)
  
  end
  
  def plop
    
  end
  
  def self.compare_interaction(thing1, thing2, interaction)
    thing1.send(interaction)
  end
  
end


