class Book
  attr_accessor :publisher, :cover_state, :label_id, :id

  def initialize(publisher, cover_state)
    super()
    @id = Random.rand(1...10_000)
    @publisher = publisher
    @cover_state = cover_state.to_s
    @label_id = ''
  end
end
