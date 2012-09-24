class Interaction
  attr_reader :t1, :t2, :action, :offsets
  @@types = [:breed, :fight, :eat]
  
  def self.types
    @@types
  end
  
  def initialize(t1,t2)
    @t1 = t1
    @t2 = t2
    @action = get_action
  end
  
  def run
    
  end
  
  def get_action
    calculate_offsets
    adjust_offsets
    @action_choice_offsets.max_by{|k,v| v.abs}[0]
  end
  
  def calculate_offsets
    @offsets = Hash[Thingy.features.map { |feature| [ feature, (t1.send(feature) - t2.send(feature)) ] } ]
  end
  
  def adjust_offsets
    @action_choice_offsets = @offsets.dup
    @action_choice_offsets.each { |k,v| @action_choice_offsets[k] = adjusted_offset(v) }
  end
  
  def adjusted_offset(value)
    adjustment = (0.5+rand)
    (value * adjustment).round(2)
  end
  
end