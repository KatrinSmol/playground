Group.destroy_all
User.destroy_all
Student.destroy_all
puts "Everything just destroyed"

@group_covers_path = "public/autoupload/group_covers/"
@student_selfies_path = "public/autoupload/student_selfies/"

def group_cover(file_name)
  File.open(File.join(Rails.root, @group_covers_path + file_name))
end

groups = [
  {
    start_year: 2016,
    end_year:  2020,
    codename: "HSEADC2016",
    name: "Поток 2020",
    cover: group_cover("group_cover19.jpg")
  },{
    start_year: 2017,
    end_year:  2021,
    codename: "HSEADC2017",
    name: "Ночь нежна",
    cover: group_cover("group_cover19.jpg")
  },{
    start_year: 2018,
    end_year:  2022,
    codename: "HSEADC2018",
    name: "Третий отряд",
    cover: group_cover("group_cover19.jpg")
  },{
    start_year: 2019,
    end_year:  2023,
    codename: "HSEADC2019 G19",
    name: "HSEADC2019 G19",
    cover: group_cover("group_cover19.jpg")
  }, {
    start_year: 2019,
    end_year:  2023,
    codename: "HSEADC2019 G20",
    name: "HSEADC2019 G20",
    cover: group_cover("group_cover19.jpg")
  }
]

groups.each do |group|
  g = Group.create(group)
  puts "New group just was created with id #{ g.id } with name #{ g.name }"
end

users = [
  {
    email: 'katrinsmol@mail.ru',
    password: 'testtest',
    first_name: 'Katrin',
    last_name: 'Smol',
    instagram: 'katrinsmol'
  },
  {
    email: 'user@user.ru',
    password: 'testtest',
    first_name: 'Puki',
    last_name: 'Pukipuki',
    middle_name: 'Alex',
    facebook: 'pukipuki',
    vkontakte:'pukipuki',
    youtube: 'pukipuki',
    hse_portfolio: 'pukipuki'
  }
]

def create_user(user)
  u = User.create!(
    email: user[:email],
    password: user[:password]
  )

  puts "User with email #{ u.email } just created"

  s = Student.find_by(user_id: u.id)

  s.first_name = user[:first_name]
  s.last_name = user[:kasr_name]
  s.middle_name = user[:middle_name]
  s.facebook = user[:facebook]
  s.vkontakte = user[:vkontakte]
  s.youtube = user[:youtube]
  s.hse_portfolio = user[:hse_portfolio]
  s.instagram = user[:instagram]


  s.save!

  puts "Student updated"
end

users.each do |user|
  create_user(user)
end

Student.all.each do |student|
  file_list = Dir.entries(File.join(Rails.root, @student_selfies_path))
  file = File.open(File.join(Rails.root, @student_selfies_path + file_list.sample))
  student.selfies.create(image: file)
end


groups_with_members = [
  {
    codename: "HSEADC2016",
    start_date: DateTime.new(2016,9,1),
    reason: "Поступление",
    students: [
      {
        last_name: "Смолянская",
        first_name: "Екатерина",
        middle_name: "Александровна",
      },{
        last_name: "Смолянская",
        first_name: "Екатерина",
        middle_name: "Александровна",
      }
    ]
  },{
    codename: "HSEADC2017",
    start_date: DateTime.new(2017,9,1),
    reason: "Поступление",
    students: [
      {
        last_name: "Смолянская",
        first_name: "Екатерина",
        middle_name: "Александровна",
      },{
        last_name: "Смолянская",
        first_name: "Екатерина",
        middle_name: "Александровна",
      }
    ]
  }
]

groups_with_members.each do |group_with_members|
  group = Group.find_by_codename(group_with_members[:codename])

  group_with_members[:students].each do |student|
    #s = Student.create!(student)
    s = group.students.create!(student)
    m = s.memberships.last

    m.start_date = group_with_members[:start_date]
    m.reason = group_with_members[:reason]
    m.save!
  end
end
