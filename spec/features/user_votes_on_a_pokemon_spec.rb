require 'rails_helper'

feature 'user votes on a review', %{
  As a user
  I want to vote on a review
  So that I can show which review I like and dislike
  Acceptance Criteria
  [] User sees upvote button
  [] User sees downvote button
  [] User must click links
  [] User will see updated points
  [] User is able to unvote
} do
  let(:review) { FactoryGirl.create(:review) }

  scenario "visit details page, clicks upvote button", js: true do
    visit pokemon_path(review.pokemon)
    page.find('.upvote-button').click

    expect(page).to have_content('1')
  end

  scenario "visit details page, clicks downvote button", js: true do
    visit pokemon_path(review.pokemon)
    page.find('.downvote-button').click

    expect(page).to have_content('-1')
  end

  scenario "visit details page, clicks Unvote button", js: true do
    visit pokemon_path(review.pokemon)
    page.find('.downvote-button').click
    page.find('.unvote-button').click

    expect(page).to have_content('0')
  end

  scenario "user can't upvote more than once", js: true do
    visit pokemon_path(review.pokemon)
    page.find('.upvote-button').click
    page.find('.upvote-button').click

    expect(page).to have_content('1')
  end

  scenario "user can't downvote more than once", js: true do
    visit pokemon_path(review.pokemon)
    page.find('.downvote-button').click
    page.find('.downvote-button').click
    expect(page).to have_content('-1')
  end
end
