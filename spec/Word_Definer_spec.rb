require 'rspec'
require 'word_definer'
require "pry"
require "kid_definer"

describe '#Word'  do

  describe('.all') do
    it("returns all items in array") do
      expect(Word.all.count).to(eq(3))
    end
  end

  describe('#save') do
    it("saves an word") do
      word = Word.new({:word => "word", :definition => "definition"}) # nil added as second argument
      word.save()
      expect(Word.all).to(include(word))
    end
  end


 describe('#delete') do
  it("deletes an definition by id") do
    definition = Kid_def.new({:word_id => 3, :definition => "definition"})
    definition.save()
    definition.delete()
    expect(Kid_def.all).not_to(include(definition))
  end
end
end
