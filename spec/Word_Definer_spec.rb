require 'rspec'
require 'word_definer'
require "pry"
require "kid_definer"

describe '#Word'  do

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an word") do
      word = Word.new({:word => "word", :definition => "definition"}) # nil added as second argument
      word.save()
      word2 = Word.new({:word => "word", :definition => "definition"}) # nil added as second argument
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end


 describe('#delete') do
  it("deletes an definition by id") do
    definition = Kid_def.new({:word_id => 3, :definition => "definition"})
    definition.save()
    definition.delete()
    expect(Kid_def.all).to(eq([]))
  end
end
end
