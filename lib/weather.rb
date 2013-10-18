module Weather

  def random_number
    Random.rand(10)
  end

  def stormy?
    if random_number >= 3
      false
    else
      true
    end
  end
  
end