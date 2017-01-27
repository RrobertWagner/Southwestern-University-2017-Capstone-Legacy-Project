require 'test_helper'

class PirateHuntTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #using User.id or Hunt.id does not work. Neither does using 'user' for user
  #or using '12125125', 12512124, '#15125125', or #12512512 for either. 
  
  #test that the entry is valid when all parameters are entered
  test "pirate hunt complete" do
  	pirateHunt = PirateHunt.create(completed: false, user_id: 1234, hunt_id: 1235)
  	assert pirateHunt.valid?, 'PirateHunt data saved'
  end

  #test that the entry is invalid without a completed parameter
  test "pirate hunt without completion" do
  	pirateHunt = PirateHunt.create(user_id: 1234, hunt_id: 1235)
  	assert_not pirateHunt.valid?, 'invalid without completed parameter'
  end

  #test that the entry is invalid without a user id
  test "pirate hunt without pirate" do
  	pirateHunt = PirateHunt.create(completed: false, hunt_id: 1235)
  	assert_not pirateHunt.valid?, 'invalid without user id parameter'
  end
  
  #test that the entry is invalid without a hunt id
  test "pirate hunt without hunt" do
  	pirateHunt = PirateHunt.create(completed: false, user_id: 1234)
  	assert_not pirateHunt.valid?, 'invalid without hunt id parameter'
  end

end

