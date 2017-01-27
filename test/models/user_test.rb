require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #may need to add all of the other fields from the schema to get a pass
 test "user has display name, email and encrypted password" do
	user = User.create(display_name: 'user', email: 'user1@gmail.com', encrypted_password: 'password1')
	assert user.valid?, "User information saved"
 end
 
 test "no display name entered" do
	user = User.create(email: 'user1@gmail.com', encrypted_password: 'password1')
	assert_not user.valid?, "display name not entered"
 end

 test "no email entered" do
	user = User.create(display_name: 'user', encrypted_password: 'password1')
	assert_not user.valid?, "email not entered"
 end
 
 test "no encrypted password entered" do
    user = User.create(display_name: 'user', email: 'user1@gmail.com')
	assert_not user.valid?, "password not entered"
 end
  
end

#may need later
#, created_at: '2015-03-24 17:12:02', updated_at: '2015-03-24 17:12:02', id: '987654321'