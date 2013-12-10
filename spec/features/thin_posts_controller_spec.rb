require 'feature_spec_helper'

describe 'Thin Controller behaviours' do

  specify 'With no (thin) posts' do
    Given 'there are no (thin) posts'
    When 'I visit the (thin) posts page'
    Then 'I see that there are no (thin) posts'
  end

  specify 'Creating a (thin) post' do
    Given 'there are no (thin) posts'

    When 'I visit the (thin) posts page'
    And 'I create a (thin) post'

    Then 'I see my (thin) post'

    When 'I visit the (thin) posts page'

    Then 'I see my (thin) post'
  end

  def there_are_no_thin_posts
    # no op
  end

  def i_visit_the_thin_posts_page
    visit thin_posts_path
    expect(page).to have_content('Listing thin posts')
  end

  def i_see_that_there_are_no_thin_posts
    expect(page).to_not have_selector('tbody tr')
  end

  def i_create_a_thin_post
    click_on 'New Thin post'
    fill_in 'Title', with: 'SRP and Rails'
    fill_in 'Body', with: 'Separation of concerns is achievable in Rails.'
    click_on 'Create Thin post'
  end

  def i_see_my_thin_post
    expect(page).to have_content('SRP and Rails')
    expect(page).to have_content('Separation of concerns is achievable in Rails.')
  end

end
