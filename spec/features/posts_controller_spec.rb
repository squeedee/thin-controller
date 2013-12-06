require 'feature_spec_helper'

describe 'Common Rails Controller behaviours' do

  specify 'With no posts' do
    Given 'there are no posts'
    When 'I visit the posts page'
    Then 'I see that there are no posts'
  end

  specify 'Creating a post' do
    Given 'there are no posts'

    When 'I visit the posts page'
    And 'I create a post'

    Then 'I see my post'

    When 'I visit the posts page'

    Then 'I see my post'
  end

  def there_are_no_posts
    # no op
  end

  def i_visit_the_posts_page
    visit posts_path
    expect(page).to have_content('Listing posts')
  end

  def i_see_that_there_are_no_posts
    expect(page).to_not have_selector('tbody tr')
  end

  def i_create_a_post
    click_on 'New Post'
    fill_in 'Title', with: 'SRP and Rails'
    fill_in 'Body', with: 'Separation of concerns is achievable in Rails.'
    click_on 'Create Post'
  end

  def i_see_my_post
    expect(page).to have_content('SRP and Rails')
    expect(page).to have_content('Separation of concerns is achievable in Rails.')
  end

end
