class List < ApplicationRecord
  validates :name, :length => {:minimum => 3}

  has_many :items
  has_many :shared_lists
  has_many :users, :through => :shared_lists

  accepts_nested_attributes_for :items

  def self.permissions_for(*args)
    association = args[0]
    methods = args[1..-1]

    # association :shared_lists
    # methods [:edit, :view]

    # define 2 methods whose names are the elements in methods array

    methods.each do |method_name|
      define_method "#{method_name}able_by?" do |user|
        #the block you pass method becomes method
        # building a mehthod that will get passed user -- arg
        assoc = self.send(association).find_by(:user_id => user.id)
        if !assoc
          return false
        else
          assoc.send("#{method_name}able?")
        end
      end
    end
  end

  permissions_for :shared_lists, :edit, :view, :destroy

end
