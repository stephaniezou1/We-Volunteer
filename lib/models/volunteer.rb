class Volunteer < ActiveRecord::Base
    
    has_many :assignments
    has_many :tasks, through: :assignments

    def self.register_a_new_full_name(interface)
        prompt = TTY::Prompt.new
        full_name_of_the_volunteer = prompt.ask("What is your full name?")
        if Volunteer.find_by(full_name: full_name_of_the_volunteer)
            puts "Sorry, the profile has been taken!"
        else
           found_fullname = Volunteer.create(full_name: full_name_of_the_volunteer)
        #    interface.volunteer = found_fullname
        #    interface.main_menu
        end
    end
    
    
    def self.log_someone_in(interface)
        prompt = TTY::Prompt.new 
        full_name_of_the_volunteer = prompt.ask("What is your full name?")
        found_fullname = Volunteer.find_by(full_name: full_name_of_the_volunteer)
        if found_fullname
            return found_fullname
            # interface.volunteer = found_fullname
            # interface.main_menu
        else
            puts "Sorry, that profile could not be found!"
        end

    end

    def display_assignments
        assignments_names = self.assignments.map do |assignment_instance|
            {assignment_instance.task.name => assignment_instance.id }
        end
        if assignments_names.length > 0
            organization_id = TTY::Prompt.new.select("Choose an assignment", assignments_names) 
        #     found_organization = Organization.find(organization_id)
        #     found_organization.display_tasks # organization method
        else
            puts "You haven't chosen any assignments yet"
            sleep 1
        end
    end    

    def add_assignment(chosen_task, interface)
        Assignment.create(volunteer: self, task: chosen_task)
        puts "\nAdd complete."
        sleep 1
        reload
        interface.see_all_organizations
        # Organization.display_organizations(self, interface)
    end


    def remove_an_assignment(interface)
        assignments_names = self.assignments.map do |assignment_instance|
            {assignment_instance.task.name => assignment_instance.id }
        end
        answer_assignment_id = TTY::Prompt.new.select("Here are your options", assignments_names)
        self.assignments.find(answer_assignment_id).delete
        reload
        sleep 1
        interface.main_menu
        #find the instance from assignment_names and delete

        #binding.pry
        # assignments_names.destroy_by(answer_assignment_id)
        # .delete_if { |h| h["k1"] == "v3" }
        # assignment_instance.task.name answer_assignment_id 
        # {|h| h["#{self.assignments.task_id}"] == answer_assignment_id}
    end
        
    # def self.display_organizations
    #     organization_names = self.organizations.map do |organization_instance|
    #         {organization_instance.name => organization_instance.id }
    #     end

    #     #the value of the hash is what gets returned after the select
    #     #the key of the hash is what the user seems
    #     if organization_names.length > 0
    #         TTY::Prompt.new.select("Choose an organization", organization_names)
    #         organization_id = TTY::Prompt.new.select("Choose an organization", organization_names)
    #         found_organization = Organization.find(organization_id)
    #         found_organization.display_tasks # organization method
    #     else
    #         puts "You haven't chosen any organizations yet"
    #         sleep 3
    #     end
    # end
end