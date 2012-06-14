class Project < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_many :tasks, :dependent => :destroy

  def add_task attrs
    tasks.create attrs
  end
end
