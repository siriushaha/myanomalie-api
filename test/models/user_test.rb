require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password_digest: 'test', first_name: 'Test', last_name: 'Test')
    assert user.valid?
  end

  test 'user with a invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test', first_name: 'Test', last_name: 'Test')
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test', first_name: 'Test', last_name: 'Test')
    assert_not user.valid?
  end

  test 'user with missing first name should be invalid' do
    user = User.new(email: 'test@test.org', password_digest: 'test', last_name: 'Test')
    assert_not user.valid?
  end

  test 'user with missing last name should be invalid' do
    user = User.new(email: 'test@test.org', password_digest: 'test', first_name: 'Test')
    assert_not user.valid?
  end

end
