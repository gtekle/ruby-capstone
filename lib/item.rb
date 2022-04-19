require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Randome.rand(1..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.includes?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.includes?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.includes?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.includes?(self)
  end
end
