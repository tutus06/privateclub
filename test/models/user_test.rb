require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
   @user = User.create(firstname: 'Prénom', lastname: 'Nom', email: 'email@example.com', password: 'MDPquitue')
 end

 test 'should be valid' do
   assert @user.valid?
 end

 test 'first name cant be blank' do
   @user.firstname = ""
   assert_not @user.valid?
 end

 test 'first name cant be empty' do
   @user.firstname = "    "
   assert_not @user.valid?
 end

 test 'last name cant be blank' do
   @user.firstname = ""
   assert_not @user.valid?
 end

 test 'last name cant be empty' do
   @user.firstname = "   "
   assert_not @user.valid?
 end

 test 'email must be unique' do
   duplicate_email = @user.dup
   assert_not duplicate_email.valid?
 end
end
