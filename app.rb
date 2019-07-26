require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:home)
end

get ('/new_word') do
  erb(:new_word)
end

get ('/word/:id') do
  # @kid_def = Kid_Def.all
  @word = Word.find(params[:id].to_i)
  # @kdeffinitions = Kid_def.find_by_word(:id)
  erb(:word)
end

post ('/new_word') do
  word = params[:word]
  definition = params[:definition]
  new_word = Word.new({:word => word, :definition => definition})
  new_word.save()
  redirect to ('/')
end
