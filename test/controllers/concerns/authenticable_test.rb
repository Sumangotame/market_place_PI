require 'test_helper'

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

class AuthenticableTest < ActionDispatch::IntegrationTest


  # Cleanup Database Cleaner after each test

  setup do
    @user = users(:one)
    @authentication = MockController.new
  end


  test 'should get authorization token' do
    @authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
    assert_equal @user.id, @authentication.current_user.id
  end

  test 'should not get user from nil authorization' do
    @authentication.request.headers['Authorization'] = nil
    assert_nil @authentication.current_user
  end
end
