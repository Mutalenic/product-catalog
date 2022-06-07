class Item
    attr_accessor :publish_date :archived
    attr_reader :author, :genre, :source, :label, :id
    def initialize(publish_date, archived: false)
        @publish_date = publish_date
        @archived = archived
        @id = rand(1..100)
    end
end

    