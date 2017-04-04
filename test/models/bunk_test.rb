require 'test_helper'

class BunkTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = false

  setup { Bunk.counter = 0 }

  test "using a rollback does not fire after_commit callbacks" do
    ActiveRecord::Base.transaction do
      bunk = Bunk.create
      bunk.destroy
      raise ActiveRecord::Rollback
    end

    assert_equal 0, Bunk.counter
  end

  test "no rollback still fires after commit for a destroyed record" do
    ActiveRecord::Base.transaction do
      bunk = Bunk.create
      bunk.destroy
    end

    assert_equal 1, Bunk.counter
  end
end
