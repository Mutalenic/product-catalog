require_relative '../item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title = '', color = '')
    @id = Random.rand(1..10_00)
    @title = title
    @color = color
    @items = []
  end
end
