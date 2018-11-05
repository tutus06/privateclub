require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
      @userone = User.create(id: 1, firstname:'First', lastname:'Last', email: 'example@example.com', password:'password')
      @usertwo = User.create(id: 2, firstname:'Firstname', lastame:'Lastname', email: 'example2@example.com', password:'password2')
    en

   test "should redirect update when logged in as wrong user" do
     get session_path(@userone)
     patch session_path(@usertwo), params: { user: { firstname: @usertwo.firstname, lastname: @usertwo.lastname, email: @usertwo.email, password: @usertwo.password} }
     assert_redirected_to login_path
  end
end
