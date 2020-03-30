class Organization < ActiveRecord::Base
    
    has_many :tasks
    has_many :assignments, through: :tasks


    def self.display_organizations(volunteer, interface)
        system 'clear'
        organization_id = Organization.all.map do |organization_instance|
            {organization_instance.title => organization_instance.id}
        end

        organization_id.push({'Main Menu' => "exit"})

        answer_organization_id = TTY::Prompt.new.select("Choose an organization to see more information.", organization_id)

        system 'clear'
        if answer_organization_id == 'exit'
            interface.main_menu
        else
        my_tasks = Organization.find(answer_organization_id).tasks
        # my_tasks = Task.find_by(organization_id: answer_id) 

        task_details = my_tasks.all.map do |task_instance|
            {task_instance.name => task_instance.id}
        end

        answer_task_org_id = TTY::Prompt.new.select("Choose an organization's task for more information.", task_details)
        chosen_task = Task.find(answer_task_org_id)
            puts chosen_task.name
            puts chosen_task.requirements
            puts chosen_task.content
            TTY::Prompt.new.select("Do you want to add this to assignments?") do |menu|
                menu.choice "Yes", -> {volunteer.add_assignment(chosen_task, interface)}
                menu.choice "No", -> {self.display_organizations(volunteer, interface)}
                menu.choice "Menu", -> {interface.main_menu} 
            end
        end
        system 'clear'
        
    end

end