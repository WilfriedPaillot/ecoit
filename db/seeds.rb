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

# 10.times do |x|
#   instructors = User.where(role: 1)
#   Training.create(title: Faker::ProgrammingLanguage.name, description: Faker::Marketing.buzzwords, user_id: instructors.sample.id)
#   p "La leçon #{Training.last.title.upcase} a été créée"
#   puts "\n"
#     3.times do |x|
#       Section.create(title: "TITRE SECTION #{x+1}", description: Faker::Marketing.buzzwords, training_id: Training.last.id)
#       p "La section #{Section.last.title} de la formation #{Training.last.title.upcase} a été créée"
#       puts "\n"    
#         3.times do |y|
#           Lesson.create(title: "TITRE LECON #{y+1}", content: Faker::Lorem.sentence(word_count: 300), section_id: Section.last.id)
#           p "La leçon #{Lesson.last.title} de la section #{Section.last.title.upcase} a été créée"
#           puts "\n"        
#         end
#     end
# end

instructor = User.where(role: 1).sample.id
Training.create(
  title: "Formation de développeur web",
  description: "Cette formation vous permettra de développer votre compétences en développement web.",
  user_id: instructor
)
  Section.create(
    title: "Introduction",
    description: "Cette section vous permettra de développer votre compétences en HTML, CSS.",
    training_id: Training.last.id
  )
    Lesson.create(
      title: "Le HTML",
      content: "HyperText Markup Language (HTML) est le code utilisé pour structurer une page web et son contenu. Par exemple, le contenu de votre page pourra être structuré en un ensemble de paragraphes, une liste à puces ou avec des images et des tableaux de données. Comme le suggère le titre, cet article vous fournit les bases de compréhension du HTML et de ses fonctions.",
      url: 'https://www.youtube.com/watch?v=8FqZZrbnwkM',
      section_id: Section.last.id
    )
    Lesson.create(
      title: "Le CSS",
      content: "CSS est l'un des langages principaux du Web ouvert et a été standardisé par le W3C. Ce standard évolue sous forme de niveaux (levels), CSS1 est désormais considéré comme obsolète, CSS2.1 correspond à la recommandation et CSS3, qui est découpé en modules plus petits, est en voie de standardisation.",
      url: 'https://www.youtube.com/watch?v=qTN9bNaBCK8',
      section_id: Section.last.id
    )
  Section.create(
      title: "Javascript",
      description: "Cette section vous permettra de développer votre compétences en Javascript.",
      training_id: Training.last.id
  )
    Lesson.create(
        title: "Le Javascript en partant de ZERO 1/2",
        content: "Le Javascript est un langage de programmation informatique qui permet de créer des interfaces interactives. Il est utilisé pour créer des interfaces dynamiques et interactives. Il est utilisé pour créer des interfaces interactives et dynamiques. Il est utilisé pour créer des interfaces dynamiques et interactives.\n
        Nous verrons les fondamentaux du langage et concluerons par la réalisation d'un projet de calculatrice.",
        url: 'https://www.youtube.com/watch?v=9OJLxDxyNg4',
        section_id: Section.last.id
    )
    Lesson.create(
        title: "Le Javascript en partant de ZERO 2/2",
        content: "Du DOM (Document Object Model), c'est l'interface de base entre le navigateur et le document. Il permet de manipuler le document, de créer des éléments, de les manipuler, de les manipuler, etc.\n
        Ce cours vous montrera comment manipuler le DOM pour dynamiser un site web et ce concluera par la création d'un petit projet de compteur de bulles",
        url: 'https://www.youtube.com/watch?v=6q-zt0aQ74U',
        section_id: Section.last.id
    )

p '*' * 20
p "La formation #{Training.last.title.upcase} a été créée"
p '*' * 20

Training.create(
  title: "Formation Ruby on Rails",
  description: "Cette formation vous permettra de développer votre compétences dans le développement web avec Ruby on Rails.",
  user_id: instructor
)
  Section.create(
    title: "Introduction",
    description: "Cette section vous permettra d'aborder le framework Ruby on Rails.",
    training_id: Training.last.id
  )
    Lesson.create(
      title: "Introduction",
      content: "Ruby on Rails est un framework de développement web open-source. Il permet de créer des application Web sécurisées et évolutives. ",
      url: 'https://www.youtube.com/watch?v=zppMfm4fuxM',
      section_id: Section.last.id
    )
    Lesson.create(
      title: "Introduction",
      content: "Ruby on Rails est un framework de développement web open-source. Il permet de créer des application Web sécurisées et évolutives. ",
      url: 'https://www.youtube.com/watch?v=sAi1r8tzzS4',
      section_id: Section.last.id
    )
    Lesson.create(
      title: "Rails basics",
      content: "Ruby on Rails est un framework de développement web open-source. Il permet de créer des application Web sécurisées et évolutives. ",
      url: 'https://www.youtube.com/watch?v=sAi1r8tzzS4',
      section_id: Section.last.id
    )
    Lesson.create(
      title: "Rails first app",
      content: "Ruby on Rails est un framework de développement web open-source. Il permet de créer des application Web sécurisées et évolutives. ",
      url: 'https://www.youtube.com/watch?v=fP64Wvz13AM&list=RDCMUCfWZwsP8trUy5uHJg8gcGIQ&index=2',
      section_id: Section.last.id
    )

    p '*' * 20
    p "La formation #{Training.last.title.upcase} a été créée"
    p '*' * 20

    
  #   p ' #######################################'
  # p '## Generation des tables user_training ##'
  # p ' #######################################'
  # puts "\n"*2

# UserTraining.create(user_id: User.where(role: 0).first.id, training_id: Training.first.id)
# puts " - Link 'user_training' nr. #{UserTraining.last.id} created between user nr. #{User.where(role: 0).first.id} (#{User.find(User.where(role: 0).first.id).email}) and training '#{Training.first.title}'"

# UserTraining.all.each do |ut|
#   my_training = Training.find(ut.id)
#   my_chapters = Section.where(training_id:my_training.id)
#   my_lessons = Lesson.where(section_id:my_chapters.ids)

#   my_chapters.each do |chapter|
#   UtSection.create(user_training_id: ut.id)
#   puts "Section nr. #{chapter.title} created between user_training nr. #{ut.id} and section nr. #{chapter.id}"
#     my_lessons.each do |lesson|
#       UtsLesson.create(ut_section_id: lesson.section_id)
#       puts "Lesson nr. #{lesson.title} created between user_training nr. #{ut.id} and section nr. #{lesson.section_id}"
#     end
#   end
# end