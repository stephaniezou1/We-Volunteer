# require 'httparty'
# require 'json'
require 'pry'

Organization.destroy_all
Task.destroy_all
Volunteer.destroy_all
Assignment.destroy_all

gary = Volunteer.create({full_name: "Gary Lau"})
stephanie = Volunteer.create(full_name: "Stephanie Zou")
ruby = Volunteer.create(full_name: "Ruby Rails")
naomi = Volunteer.create(full_name: "Naomi Elegant")
mina = Volunteer.create(full_name: "Mina Zhou")

# gary_assignment = Assignment.new("Gary's Assignment", volunteer: gary, task:   )
# gary_task = Task.new() 

red_cross = Organization.create(
    title: ("Red Cross").colorize(:green), 
    summary: "Public Health and Wellness"
    )
pro_bono_consulting = Organization.create(
    title: ("Pro Bono Consulting").colorize(:green), 
    summary: "Lend you professional services to local businesses"
    )
library = Organization.create(
    title: ("Library").colorize(:green), 
    summary: "Volunteer your time to help with afterschool programs for elementary school students in libraries across NYC"
    )
in_tandem_cycling = Organization.create(
    title: ("In-Tandem Cycling").colorize(:green), 
    summary: "InTandem Cycling is a 501c3 not-for-profit organization whose mission is to provide tandem cycling programs to people who are blind, have low vision, or cannot ride independently due to other disabilities."
    )
zoo = Organization.create(
    title: ("Zoo").colorize(:green)
)


hospital_volunteer = Task.create(
organization: red_cross, 
name: ("Task: Blood Donor").colorize(:light_magenta), 
requirements: ("\nRequirements: Volunteer must be a minumum of 18 years old and present necessary documents indicating good health").colorize(:light_green), 
content: ("\nDescription: Donate blood now! Blood donation is important because maintaining an adequate blood supply in our community secures blood transfusions for patients.\n").colorize(:light_blue)
)

pro_bono_consulting = Task.create(
organization: pro_bono_consulting, 
name: ("Task: Pro Bono Consultant").colorize(:light_magenta), 
requirements: ("\nRequirements: Bachelor's Degree in business, finance, or operations management or work experience equivalent. Advanced proficiency in Microsoft PowerPoint, Excel, and financial modeling").colorize(:light_green), 
content: ("\nDescription: If you are a young professional looking to dedicating some of your time to helping out local businesses and nonprofit organizations improve their business plans, investor presentations, operational efficiency, and overall performance, sign up with us and we'll match you with an organization in need of your services.\n").colorize(:light_blue)
)

library_volunteer = Task.create(
organization: library, 
name: ("Task: Library Volunteer").colorize(:light_magenta), 
requirements: ("\nRequirements: Must be a minimum of 18 years old. Must be proficient in English. Experience working with younger children is preferred.").colorize(:light_green), 
content: ("\nDescription: Join us once a week to help out with our reading sessions for local elementary schools. We host afterschool programs to meet the demands of underserved school disticts. Volunteers can improve library services in the following specific ways: Expand support for routine tasks and special library projects; Enhance the level and quality of customer services; and Provide supplemental expertise. nonprofit, educational purposes.\n").colorize(:light_blue) )

in_tandem_cyclist = Task.create(
    organization: in_tandem_cycling, 
    name: ("Task: In-Tandem Cycling Volunteer").colorize(:light_magenta), 
    requirements: ("\nRequirements: Must be minimum of 18 years old and attend one of our training sessions first prior to riding").colorize(:light_green), 
    content: ("\nDescription: There are few accessible opportunities for people with disabilities to exercise or socialize and we provide both! Located in New York City, we welcome you to join our programs and participate in our Rides. We have evening and weekend rides in Central Park, NYC. Members are matched with riders of the same skill level. Members are encouraged to use equipment outside scheduled rides and events.\n").colorize(:light_blue)
    )

hospital_technician = Task.create(
    organization: red_cross,
    name: ("Task: Lab Technician").colorize(:light_magenta),
    requirements: ("\nRequirements: Bachelor's Degree in a type of science. Proficiency in modern lab techniques.").colorize(:light_green),
    content: ("\nContent: Handles lab equipment to be used during lab procedures. Run lab tests in a timely manner and return precise results.\n").colorize(:light_blue)
)
zoo_keeper = Task.create(
     organization: zoo,
     name: ("Task: Zoo Keeper").colorize(:light_magenta),
     requirements: ("\nRequirements: Bachelor's Degree in biology or animal science. Experience with animls preferred.").colorize(:light_green),
     content: ("\nContent: Daily maintenance of animals and their habitat. Help train and entertain them when needed.").colorize(:light_blue)
 )
zoo_technician = Task.create(
     organization: zoo,
     name: ("Task: Zoo Technician").colorize(:light_magenta),
     requirements: ("\nRequirements: Proficiency in technical repairs is required.").colorize(:light_green),
     content: ("\nContent: Maintaining park fixtures and lightings, assist in daily routine checks.").colorize(:light_blue)
 )
zoo_guide = Task.create(
    organization: zoo,
    name: ("Task: Zoo Guide").colorize(:light_magenta),
    requirements: ("\nRequirements: High school diploma or GED equivalent.").colorize(:light_green),
    content: ("\nContent: Will be leading group tours around the establishment on set routes. Will be trained to have knowledge on animals on said routes.").colorize(:light_blue)
)

gary_list1 = Assignment.create(volunteer: gary, task: hospital_volunteer)
gary_list2 = Assignment.create(volunteer: gary, task: hospital_technician)
stephanie_list = Assignment.create(volunteer: stephanie, task: pro_bono_consulting)
ruby_list = Assignment.create(volunteer: ruby, task: library_volunteer)
naomi_list = Assignment.create(volunteer: naomi, task: in_tandem_cyclist)


# response = HTTParty.get("https://data.cityofnewyork.us/resource/shpd-5q9m.json")
# databasearray = JSON.parse(response.body)



# def organization
#     response = HTTParty.get("https://data.cityofnewyork.us/resource/shpd-5q9m.json")
#     databasearray = JSON.parse(response.body)
#     counter = 0
#     while counter < databasearray.length
#         title = databasearray[counter]["title"]
#         position = databasearray[counter]["opportunity_id"]
#         #sanitize requirements & content_id
#         requirements = databasearray[counter]["requirements"].gsub(/<\/?[^>]*>/, "")
#         content = databasearray[counter]["content_id"].gsub(/<\/?[^>]*>/, "")
#         summary = databasearray[counter]["summary"]
#         url = databasearray[counter]["website"]
#         street_address = databasearray[counter]["street_address"]
#         city = databasearray[counter]["city"]
#         state = databasearray[counter]["state"]
#         postcode = databasearray[counter]["postcode"]
#         organization[counter]= Organization.create(title: title, position: position, requirements: requirements, content: content,summary: summary, url: url, street_address: street_address, city: city, state: state, postcode: postcode)
#         counter += 1
#     end
# end


# requirements = organization["requirements"]
# organization()
# binding.pry

    # t.string :title
    # t.string :position
    #   t.string :requirements
    #   t.text :content
    #   t.string :summary
    #   t.string :url
    #   t.string :street_address
    #   t.string :city
    #   t.string :state
    #   t.string :postcode


#organization
# organization = databasearray.each do |org|
#     org
# end

#position

# position = databasearray.map do |org|
# # opportunity
# opportunity = databasearray.map do |org|
#     org["opportunity_id"]
# end

# # requirements
# # SANITIZE HTML TAGS
# requirements = databasearray.map do |org| 
#     org["requirements"]
# end


# content = databasearray.map do |org|
#     org["content_id"]
# end

#  summary = databasearray.map do |org|
#     org["summary"]
# end

#  url = databasearray.map do |org|
#     org["website"]
# end

# street_address = databasearray.map do |org|
#     org["street_address"]
# end

# city = databasearray.map do |org|
#     org["city"]
# end

# state = databasearray.map do |org|
#     org["state"]
# end

# postcode = databasearray.map do |org|
#     org["postcode"]
# end

# #ADD TITLE OF ORGANIZATION

# 0