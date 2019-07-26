require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('./lib/kid_definer')
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
  @kid_def = Kid_def.all
  @word = Word.find(params[:id].to_i)
  @kdef = Kid_def.find_by_word(:id)
  erb(:word)
end
get ('/word/:word_id/definition/:kdef_id') do
  @word = Word.find(params[:word_id].to_i())
  @kdef = Kid_def.find(params[:kdef_id].to_i())
  erb(:def_edit)
end

patch ('/word/:word_id/definition/:kdef_id') do
  @word = Word.find(params[:word_id].to_i())
  @kdef = Kid_def.find(params[:kdef_id].to_i())
  @kdef.update(params[:definition], @word.id)
  erb(:word)
end

post ('/new_word') do
  word = params[:word]
  definition = params[:definition]
  new_word = Word.new({:word => word, :definition => definition})
  new_word.save()
  redirect to ('/')
end

post ('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @kdef = Kid_def.new({:definition => params['kdef'], :word_id => @word.id})
  @kdef.save()
  erb(:word)
end
