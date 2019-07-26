require('./lib/word_definer')

class Kid_def
  attr_reader :id
  attr_accessor :name, :definition, :word_id

  @@kdef = {}
  @@total_rows = 0

  def initialize(attributes)
      @definition = attributes.fetch(:definition).capitalize.strip
      @word_id = attributes.fetch(:word_id)
      id = attributes.fetch(:id, nil)
      @id = id|| @@total_rows += 1
    end

  def self.find_by_word(word_id)
    definitions = []
    @@kdef.values.each do |definition|
      definitions.push(definition) if definition.word_id == word_id
    end
    definitions
  end

  def self.find(id)
    @@kdef[id]
  end

  def save
      # @@kdef[self.id] = Kid_def.new({:definition => self.definition, :word_id => self.word_id, :id => self.id})
      @@kdef[self.id] = self
    end

  def self.all
      @@kdef.values
    end

  def all_definitions
    Kid_def.find_by_word(self.id)
  end

  def update(name, word_id)
      self.name = name
      self.word_id = word_id
      @@kdef[self.id] = Song.new(self.name, self.word_id, self.id)
    end

    def delete
      @@kdef.delete(self.id)
    end

    def self.clear
      @@kdef = {}
    end

  def album
    Word.find(self.word_id)
  end
end
