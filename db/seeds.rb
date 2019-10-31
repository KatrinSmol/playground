Group.destroy_all
User.destroy_all
Student.destroy_all
puts "Everything just destroyed"

groups = [
  {
    start_year: 2018,
    end_year:  2022,
    codename: "HSEADC2018",
    name: "Третий отряд"
  }, {
    start_year: 2017,
    end_year:  2021,
    codename: "HSEADC2017",
    name: "Ночь нежна"
  }, {
    start_year: 2016,
    end_year:  2020,
    codename: "HSEADC2016",
    name: "Поток 2020"
  }, {
    start_year: 2019,
    end_year:  2023,
    codename: "HSEADC2019 G19",
    name: "HSEADC2019 G19"
  }, {
    start_year: 2019,
    end_year:  2023,
    codename: "HSEADC2019 G20",
    name: "HSEADC2019 G20"
  }
]

groups.each do |group|
  g = Group.create(group)
  puts "New group just was created with id #{ g.id } with name #{ g.name }"
end

user = User.create!(
  email: 'katrinsmol@mail.ru',
  password: 'testtest'
)

puts "User with email #{ user.email } just created"

student = Student.find_by(user_id: user.id)
student.first_name = "Katrin"
student.last_name = "Smol"

student.save!

puts "Student updated"
