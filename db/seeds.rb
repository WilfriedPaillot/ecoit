# Erase the content of all tables, hence reseting the related "id" counters
DatabaseCleaner.clean_with(:truncation)

p ' ########################'
p '## Generation des users ##'
p ' ########################'
puts "\n"*2

5.times do |i|
  User.create(email: "admin#{i+1}-ecodevit@yopmail.com", password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8), role: 2)
    p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
    p "Son adresse email est #{User.last.email}."
    p "Son role est #{User.last.role}."
    puts "\n"
  User.create(email: "student#{i+1}-ecodevit@yopmail.com", password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8))
    p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
    p "Son adresse email est #{User.last.email}."
    p "Son role est #{User.last.role}."
    puts "\n"
  User.create(email: "instructor#{i+1}-ecodevit@yopmail.com", password: 'EcoDevIT@2022', nickname: Faker::Internet.username(specifier: 5..8), role: 1)
    p "L'utilisateur #{User.last.nickname.capitalize} vient d'être généré."
    p "Son adresse email est #{User.last.email}."
    p "Son role est #{User.last.role}."
    puts "\n"*2
end

p ' #############################'
p '## Generation des formations ##'
p ' #############################'
puts "\n"*2

2.times do |x|
  Training.create(title: Faker::ProgrammingLanguage.name, description: Faker::Marketing.buzzwords, user_id: User.where(role: 1).last.id)
  p "La leçon #{Training.last.title.upcase} a été créée"
  puts "\n"
    3.times do |x|
      Section.create(title: "TITRE SECTION #{x+1}", description: Faker::Marketing.buzzwords, training_id: Training.last.id)
      p "La section #{Section.last.title} de la formation #{Training.last.title.upcase} a été créée"
      puts "\n"    
        3.times do |y|
          Lesson.create(title: "TITRE LECON #{y+1}", content: Faker::Lorem.sentence(word_count: 300), section_id: Section.last.id)
          p "La leçon #{Lesson.last.title} de la section #{Section.last.title.upcase} a été créée"
          puts "\n"        
        end
    end
end

  p ' #######################################'
  p '## Generation des tables user_training ##'
  p ' #######################################'
  puts "\n"*2

UserTraining.create(user_id: User.where(role: 0).first.id, training_id: Training.first.id)
puts " - Link 'user_training' nr. #{UserTraining.last.id} created between user nr. #{User.where(role: 0).first.id} (#{User.find(User.where(role: 0).first.id).email}) and training '#{Training.first.title}'"

UserTraining.all.each do |ut|
  my_training = Training.find(ut.id)
  my_chapters = Section.where(training_id:my_training.id)
  my_lessons = Lesson.where(section_id:my_chapters.ids)

  my_chapters.each do |chapter|
  UtSection.create(user_training_id: ut.id)
  puts "Section nr. #{chapter.title} created between user_training nr. #{ut.id} and section nr. #{chapter.id}"
    my_lessons.each do |lesson|
      UtsLesson.create(ut_section_id: lesson.section_id)
      puts "Lesson nr. #{lesson.title} created between user_training nr. #{ut.id} and section nr. #{lesson.section_id}"
    end
  end
end