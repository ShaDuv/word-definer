require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create word', {:type => :feature}) do
  it('creates an word and then goes to the home page') do
    visit('/')
    click_on('Add a New Word')
    fill_in('word', :with => 'Bacon')
    click_on('Create')
    expect(page).to have_content('Bacon')
  end
end

describe('creates a new word and adds view definition', {:type => :feature}) do
  it('creates an word and definition and then goes to the word page to view definition') do
    visit("/")
    click_on('Add a New Word')
    fill_in('word', :with => 'Coffee')
    fill_in('definition', :with => 'liquid crack')
    click_on('Create')
    click_on('Coffee')
    expect(page).to have_content('Liquid crack')
  end
end

describe('add new definition', {:type => :feature}) do
  it('adds a new definition') do
    visit("/")
    click_on('Add a New Word')
    fill_in('word', :with => 'Booze')
    fill_in('definition', :with => 'how I survivied Webpack week')
    click_on('Create')
    click_on('Booze')
    fill_in('kdef', :with => 'the liquid that gets us through the week')
    click_on("Add definition")
    expect(page).to have_content('The liquid that gets us through the week')
  end
end
