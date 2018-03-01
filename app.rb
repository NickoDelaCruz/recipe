require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/') do
  @recipes = Recipe.all
  erb(:index)
end

post('/') do
  name = params['name']
  @recipes = Recipe.all
  recipe = Recipe.create({:name => name, :instruction => nil})
  erb(:index)
end
