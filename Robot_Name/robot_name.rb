class Robot
  @@taken_names = []

  def initialize()
    @name = random_name_generator
    if @@taken_names.include?(@name)
      # Kernel.srand(Random.new_seed)
      @name = random_name_generator
    end
    @@taken_names << @name
  end

  def random_name_generator
    random_name = ''
    2.times do
      random_name = ('a'..'z').to_a.shuffle[0,2].join.upcase
    end
    3.times do
      random_name << rand(0..9).to_s
    end
    random_name
  end

  def name
    @name
  end

  def reset
    @name = random_name_generator
    @@taken_names << @name
  end
end