require('./kid_definer.rb')
class Word
  attr_accessor :word, :definition, :id

  @@dictionary = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word).capitalize.strip
    @definition = attributes.fetch(:definition).capitalize.strip
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

  def kdefs
    Kid_def.find_by_word(self.id)
  end
end
