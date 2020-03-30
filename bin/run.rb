require_relative '../config/environment'


interface = Interface.new()


interface.welcome


volunteer_instance = interface.login_or_register

until volunteer_instance
    #checks to see if there is actually a user instance
    #will run the interface.choose_login etc methods until 
    volunteer_instance = interface.login_or_register
end

interface.volunteer = volunteer_instance

interface.main_menu
interface.exit
