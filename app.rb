require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/') do
  @recipes = Recipe.all
  erb(:index)
end

post('/recipes') do
  name = params['name']
  instruction = params['instruction']
  @recipe = Recipe.create({:name => name, :instruction => instruction})
  redirect("/recipes/".concat(@recipe.id.to_s))
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i)
  erb(:recipe)
end
