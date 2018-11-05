require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(id: 1, firstname:'First', lastname:'Last', email: 'example@example.com', password:'password')
  end

  test 'not show member without log' do
  get root_path
  assert_select 'a[href=?]', members_path, count:0
  end

  #Test views Log in + Private links (members, edit, profile)
  test "login with valid information" do
      get login_path
      post login_path, params: { session: { email: @user.email, password: @user.password } }
      assert_redirected_to root_url
      follow_redirect!
      assert_template root_path
      assert_select "a[href=?]", login_path, count: 0     #navbar login
      assert_select "a[href=?]", signup_path, count: 0    #navbar Sign up
      assert_select "a[href=?]", members_path, count: 2   #Members list
      assert_select "a[href=?]", '/sessions/1', count: 1   #navbar Profil
      assert_select "a[href=?]", '/sessions/1/edit', count: 1   #navbar Edit
      assert_select "a[href=?]", logout_path, count: 1    #navbar
    end

  # Test not show profil and edit without log in or sign up
  test 'not show profil and edit without log' do
    get root_path
    assert_select 'a[href=?]', '/sessions/1', count: 0
    assert_select "a[href=?]", '/sessions/1/edit', count: 0
end
