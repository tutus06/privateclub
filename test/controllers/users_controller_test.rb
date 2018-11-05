require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  #Test de sign up

  def setup
    @user = User.new(firstname: 'Prénom', lastname: 'Nom', email: 'email@example.com', password: 'MDPquitue')
    @user.save
  end

  test 'should be valid' do
    assert @user.valid?
    assert @user.save
  end

  test 'first name cant be blank' do
    @user.firstname = ""
    assert_not @user.valid?
    assert_not @user.save
  end

  test 'last name cant be blank' do
    @user.lastname = ""
    assert_not @user.valid?
    assert_not @user.save
  end

  test 'email must be unique' do
    duplicate_email = @user.dup
    assert_not duplicate_email.valid?
    assert_not duplicate_email.save
end
