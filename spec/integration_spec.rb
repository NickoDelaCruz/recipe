require("spec_helper")

describe 'the recipe creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('name', :with => 'Casserole')
    click_button('Add recipe')
    expect(page).to have_content('Casserole')
  end
end
