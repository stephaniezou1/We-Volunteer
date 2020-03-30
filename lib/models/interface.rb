class Interface
    
    attr_reader :prompt, :assignment
    attr_accessor :volunteer

    def initialize
        @prompt = TTY::Prompt.new
        @artii = Artii::Base.new
    end

    def exit
        system 'clear'
        puts "Thank you for volunteering. Your time and effort is much appreciated by all of us!"
        sleep 1
        system 'exit!'
    end

    def welcome
        system 'clear'
        puts @artii.asciify("WeVolunteer").colorize(:green)
    end

    def login_or_register
        prompt.select("Are you logging in or registering?") do |menu|
            menu.choice "Log In", -> { Volunteer.log_someone_in(self)}
            menu.choice "Register", -> { Volunteer.register_a_new_full_name(self)}
            menu.choice "Exit", -> { self.exit }
        end
    end 

    def main_menu
        system "clear"
        prompt.select("What would you like to do today?") do |menu|
            menu.choice "See Organizations.", -> { self.see_all_organizations }
            menu.choice "See all assignments.", -> { self.see_all_assignments }
            menu.choice "Exit.", -> { self.exit }   #<---???
        end
    end

    def see_all_organizations
        system 'clear'
        Organization.display_organizations(@volunteer, self) 
        # self.main_menu
    end

    def see_all_assignments
        system "clear"
        if @volunteer.assignments.length > 0
            @volunteer.display_assignments
            prompt.select("Here are your options") do |menu|
                menu.choice "Add a task", -> { Organization.display_organizations(@volunteer, self)} 
                menu.choice "Remove an assignment", -> { @volunteer.remove_an_assignment(self) } 
                menu.choice "Return to main menu", -> { self.main_menu }
            end
            # self.main_menu
        else 
            puts "You do not have any assignments"
            sleep 1
            self.main_menu
        end
    end
    
end