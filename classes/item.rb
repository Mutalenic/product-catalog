require_relative './book-store/label'
class Item
  attr_accessor :publish_date
  attr_reader :archived, :id, :genre, :label, :author, :source

  def initialize(publish_date, archived: false)
    @publish_date = publish_date
    @archived = archived
    @id = Random.rand(1..100)
  end

  def author=(author)
    @author = author
    @author.items << self unless @author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.items << self unless @genre.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.items << self unless @source.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.items << self unless @label.items.include?(self)
  end

  def can_be_archived?
    @publish_date.year < Time.now.year - 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
