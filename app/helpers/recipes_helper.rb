module RecipesHelper
  def link_to_add_ingredient(name, f, ingredients)
    new_ingredient = f.object.send(ingredients).build
    id = new_ingredient.object_id
    fields = f.fields_for(ingredients, new_ingredient, child_index: id) do |ff|
      render('add_ingredient', f: ff)
    end
    link_to(name, '#', class: "add_ingredient", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
