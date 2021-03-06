require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/') do
  @recipes = Recipe.all
  erb(:index)
end

post('/recipes') do
  name = params['name']
  @recipe = Recipe.create({:name => name, :instruction => nil})
  redirect("/recipes/".concat(@recipe.id.to_s))
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i)
  erb(:recipe)
end

post('/recipes/:id') do
  instruction = params['instruction']
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.instruction = instruction
  erb(:recipe)
end
