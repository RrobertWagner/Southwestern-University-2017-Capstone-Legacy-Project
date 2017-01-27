require 'test_helper'

class PirateTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #test that the entry is valid when all parameters are entered
  test "pirate task complete" do
  	pirateTask = PirateTask.create(answer_uploaded: true, completed: true, user_id: 1234, task_id: 1235, hunt_id: 1236)
  	assert pirateTask.valid?, 'PirateTask data saved'
  end

  #test that the entry is invalid without an answer uploaded
   test "pirate task without answer" do
    pirateTask = PirateTask.create(completed: true, user_id: 1234, task_id: 1235, hunt_id: 1236)
    assert_not pirateTask.valid?, 'Should be invalid without all paramaters'
  end
  
  #test that the entry is invalid without a completed parameter
   test "pirate task without completed" do
    pirateTask = PirateTask.create(answer_uploaded: true, user_id: 1234, task_id: 1235, hunt_id: 1236)
    assert_not pirateTask.valid?, 'Should be invalid without all paramaters'
  end

  #test that the entry is invalid with a user id
  test "pirate task without user id" do
    pirateTask = PirateTask.create(answer_uploaded: true, completed: true, task_id: 1235, hunt_id: 1236)
    assert_not pirateTask.valid?, 'Should be invalid without all paramaters'
  end

  #test that the entry is invalid with a task id
  test "pirate task without task id" do
    pirateTask = PirateTask.create(answer_uploaded: true, completed: true, user_id: 1234, hunt_id: 1236)
    assert_not pirateTask.valid?, 'Should be invalid without all paramaters'
  end
  
  #test that the entry is invalid with a hunt id
  test "pirate task without hunt id" do
    pirateTask = PirateTask.create(answer_uploaded: true, completed: true, user_id: 1234, task_id: 1235)
    assert_not pirateTask.valid?, 'Should be invalid without all paramaters'
  end
  
end

#may want to test that the answer_uploaded and completed booleans do not conflict
#ie: True/False or False/True do not exist