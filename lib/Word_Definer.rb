class Word
  attr_accessor :word, :deff, :id

  @@dictionary = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word).capitalize
    @definition = attributes.fetch(:deff).capitalize
    @id = id || @@total_rows += 1
  end

  def save
    @@dictionary[self.id] = self
  end

  def self.all()
    @@dictionary.values()
  end

  def self.find(id)
    @@dictionary[id]
  end
end
