require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  #test that the entry is valid when all parameters are entered
  test "task is complete" do
    task = Task.create(task_type: 1, points: 25, prompt: 'Sample task', clue: 'Try to complete', correct_answer: 'Apple', hunt_id: "1234")
    assert task.valid?, 'Task information was not saved'
  end

  #test that the entry is invalid when the task type is missing
  test "task without type" do
    task = Task.create(points: 25, prompt: 'Sample task', clue: 'Try to complete', correct_answer: 'Apple', hunt_id: "1234")
    assert_not task.valid?, 'Should be invalid without all parameters'
  end

  #test that the entry is invalid when the points are missing
  test "task without points" do
    task = Task.create(task_type: 1, prompt: 'Sample task', clue: 'Try to complete', correct_answer: 'Apple', hunt_id: "1234")
    assert_not task.valid?, 'Should be invalid without all parameters'
  end

  #test that the entry is invalid when the prompt is missing
  test "task without prompt" do
    task = Task.create(task_type: 1, points: 25, clue: 'Try to complete', correct_answer: 'Apple', hunt_id: "1234")
    assert_not task.valid?, 'Should be invalid without all parameters'
  end

  #test that the entry is invalid when the clue is missing
  test "task without clue" do
    task = Task.create(task_type: 1, points: 25, prompt: 'Sample task', correct_answer: 'Apple', hunt_id: "1234")
    assert_not task.valid?, 'Should be invalid without all parameters'
  end

  #test that the entry is invalid when the correct answer is missing
  test "task without correct answer" do
    task = Task.create(task_type: 1, points: 25, prompt: 'Sample task', clue: 'Try to complete', hunt_id: "1234")
    assert_not task.valid?, 'Should be invalid without all parameters'
  end

  #test that the entry is invalid when the hunt is missing
  test "task without hunt" do
    task = Task.create(task_type: 1, points: 25, prompt: 'Sample task', clue: 'Try to complete', correct_answer: 'Apple')
    assert_not task.valid?, 'Should be invalid without all parameters'
  end
end
