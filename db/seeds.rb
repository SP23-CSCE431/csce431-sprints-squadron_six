# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# create multiple users
Adminuser.create!([
                    { email: 'squadronsixtamu@gmail.com', isaadmin: true },
                    { email: 'ivanattexas@tamu.edu', isaadmin: true },
                    { email: 'walkercharles100@tamu.edu', isaadmin: true },
                    { email: 'emily.wax@tamu.edu', isaadmin: true },
                    { email: 'pbr27@tamu.edu', isaadmin: true },
                    { email: 'qinyif001@tamu.edu', isaadmin: true },
                    { email: 'ansleythomp@tamu.edu', isaadmin: true },
                    { email: 'ansleythomp@gmail.com', isaadmin: false },
                    { email: 'alvarogarcia@tamu.edu', isaadmin: true}])
