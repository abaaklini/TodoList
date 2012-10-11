class TodoList < ActiveRecord::Base
    validates_presence_of :title
    validates_length_of :title, :minimum => 5
    has_many :list_items, :dependent => :destroy
end
