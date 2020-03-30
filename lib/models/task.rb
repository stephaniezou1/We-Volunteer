class Task < ActiveRecord::Base
    has_many :assignments
    has_many :volunteers, through: :assignments
    belongs_to :organization

    def display_task
        Organization.all
    end
end