class SharedList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  PERMISSIONS = {
    :destroy => 0,
    :edit => 10,
    :view => 100
  }

  def self.permissable(*args)

    # association :shared_lists
    # methods [:edit, :view]

    # define 2 methods whose names are the elements in methods array

    args.each do |action|
      define_method "#{action}able?" do
        #the block you pass method becomes method
        # building a mehthod that will get passed user -- arg
          self.permission <= PERMISSIONS[action]
      end
    end
  end


  permissable :view, :edit, :destroy

  ## cancancan abstracts this away! 


end
