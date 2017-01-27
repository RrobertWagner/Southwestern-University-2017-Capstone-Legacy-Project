require 'test_helper'

class HuntTest < ActiveSupport::TestCase

  #make sure all parameters entered result in the hunt being valid
  test "hunt has all required values" do
  hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3), end_date: Date.new(2015,4,3), start_location: 'CS Lounge', description: 'a new hunt')
    assert hunt.valid?, "hunt information saved"
  end
  
  #make sure other missing parameters result in the hunt not being valid
  test "hunt has no title" do
	  hunt = Hunt.create(active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
    assert_not hunt.valid?, "hunt title not saved"
  end

 test "hunt has not been declared active or inactive" do
    hunt = Hunt.create(title: 'Hunt1', published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
	  assert_not hunt.valid?, "hunt active/inactive information not saved"
  end
  
  test "hunt has not been declared published or not published" do
    hunt = Hunt.create(title: 'Hunt1', active: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
	  assert_not hunt.valid?, "hunt published information not saved" 
  end
  
  test "hunt has not been declared public or not public" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
	  assert_not hunt.valid?, "hunt public/not public not saved"
  end
  
  test "hunt has no start time" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true,  end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
    assert_not hunt.valid?, "hunt start time information not saved"
  end
  
  test "hunt has no end time" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
    assert_not hunt.valid?, "hunt end time information not saved"
  end
  
  test "hunt has no start date" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, end_date: Date.new(2015,4,4), start_location: 'CS Lounge', description: 'a new hunt')
    assert_not hunt.valid?, "hunt start date information not saved"
  end
  
  test "hunt has no end date" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , start_location: 'CS Lounge', description: 'a new hunt')
	  assert_not hunt.valid?, "hunt end date information not saved"
  end
  
  test "hunt has no start location" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), description: 'a new hunt')
	  assert_not hunt.valid?, "hunt start location not saved"
  end
  
  test "hunt has no description" do
    hunt = Hunt.create(title: 'Hunt1', active: true, published: true, public: true, start_time: Time.now, end_time: Time.now, start_date: Date.new(2015,4,3) , end_date: Date.new(2015,4,4), start_location: 'CS Lounge')
	  assert_not hunt.valid?, "hunt description not saved"
  end

end
