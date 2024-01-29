require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'Title', with: 'Harry Potter'
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.')

    post = Book.order("id").last
    expect(post.title).to eq('Harry Potter')
  end

  it 'rainy_day' do
    visit '/books/new'
    fill_in 'Title', with: ' '
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.title).to eq(' ')
  end

  it 'added_features' do
    visit '/books/new'
    fill_in 'Publisher', with: 'me'
    fill_in 'Pages', with: 100
    fill_in 'Release date', with: Date.today
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.publisher).to eq('me')
    expect(book.pages).to eq(100)
    expect(book.release_date).to eq(Date.today)

  end



end
