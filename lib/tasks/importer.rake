# namespace :import do
#   desc "Import DemoDay attendees"
#   task demoday: :environment do
#     #TODO - add email & pwd to Heroku variables
#     session = GoogleDrive.login('maedevelops@gmail.com','mypass1234')
#     importer = ImporterGuest.new('0An8eKGgdhvPsdENjU2JrRmlUTDcycUpKdUFVanh5OVE',
#                                    :user => 'maedevelops@gmail.com',
#                                    :password => 'mypass1234')
#     importer.import
#   end
#
#   desc "Import Guests"
#   task demoday: :environment do
#     #TODO - add email & pwd to Heroku variables
#     session = GoogleDrive.login('maedevelops@gmail.com','mypass1234')
#     importer = ImporterDemoday.new('1KFOCGLPaSsE-ey1IzQiw03YEmryZuutwMtT-1KxRQJQ',
#                                    :user => 'maedevelops@gmail.com',
#                                    :password => 'mypass1234')
#     importer.import
#
#   desc "Import DreamTeam folks"
#   task demoday: :environment do
#     #TODO - add email & pwd to Heroku variables
#     session = GoogleDrive.login('maedevelops@gmail.com','mypass1234')
#     importer = ImporterDemoday.new('0AjmjhIZjO4SQdHhZSVdCa21UNFVvV2t6Z1RnekdYbFE',
#                                    :user => 'maedevelops@gmail.com',
#                                    :password => 'mypass1234')
#     importer.import
#   end
#
#
# end
