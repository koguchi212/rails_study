Aim.all.each do |f|
    f.destroy
  end
10.times do |n|
    Aim.create!(
      title: Faker::ProgrammingLanguage.unique.name,
      reason: Faker::Fantasy::Tolkien.unique.character,
      advantage: Faker::JapaneseMedia::StudioGhibli.unique.character,
      difficulty: Faker::Number.between(from: 1, to: 10),
    )
  end