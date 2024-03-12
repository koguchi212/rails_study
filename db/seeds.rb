User.destroy_all

admin_user = User.create!(
  name: 'admin',
  email: 'admin@example.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
)

Aim.destroy_all

10.times do
  admin_user.aims.create!(
    title: Faker::ProgrammingLanguage.unique.name,
    reason: Faker::Fantasy::Tolkien.unique.character,
    advantage: Faker::JapaneseMedia::StudioGhibli.unique.character,
    difficulty: Faker::Number.between(from: 1, to: 10)
  )
end