class Bunk < ActiveRecord::Base
  after_commit :do_something, on: :create
  class_attribute :counter

  self.counter = 0

  private

  def do_something
    self.class.counter += 1
  end
end
