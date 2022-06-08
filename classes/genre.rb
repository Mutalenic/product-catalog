require_relative './item'

class Genre
  attr_accessor :id, :items
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..100)
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
