# Erase the content of all tables, hence reseting the related "id" counters
DatabaseCleaner.clean_with(:truncation)

p ' ########################'
p '## Generation des users ##'
p ' ########################'
puts "\n"*2
User.create(email: 'admin-ecodevit@yopmail.com', password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8), role: 2)
p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
p "Son adresse email est #{User.last.email}."
p "Son role est #{User.last.role}."
puts "\n"
User.create(email: 'student-ecodevit@yopmail.com', password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8))
p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
p "Son adresse email est #{User.last.email}."
p "Son role est #{User.last.role}."
puts "\n"
User.create(email: 'instructor-ecodevit@yopmail.com', password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8), role: 1)
p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
p "Son adresse email est #{User.last.email}."
p "Son role est #{User.last.role}."
puts "\n"*2

p ' #############################'
p '## Generation des formations ##'
p ' #############################'
puts "\n"*2

Training.create(title: Faker::ProgrammingLanguage.name, description: Faker::Marketing.buzzwords, user_id: User.where(role: 1).last.id)
p "La leçon #{Training.last.title} a été créée"
puts "\n"
  3.times do |x|
    Section.create(title: "Section #{x+1}", description: Faker::Marketing.buzzwords, training_id: Training.last.id)
    p "La section #{Section.last.title} de la formation #{Training.last.title} a été créée"
puts "\n"    
      3.times do |y|
        Lesson.create(title: "Leçon #{y+1}", content: Faker::Lorem.sentence(word_count: 300), section_id: Section.last.id)
        p "La leçon #{Lesson.last.title} de la section #{Section.last.title} a été créée"
puts "\n"        
      end
  end

