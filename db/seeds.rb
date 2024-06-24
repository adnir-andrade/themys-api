# Criação de Usuários
puts "Creating users..."
users = []
10.times do
  users << User.create!(
    username: Faker::Name.name,
    password: Faker::Internet.password,
    email: Faker::Internet.email,
    )
end

# Criação de Campanhas
puts "Creating campaigns..."
campaigns = []
3.times do
  campaigns << Campaign.create!(
    dm_id: User.pluck(:id).sample,
    name: Faker::Fantasy::Tolkien.location,
    )
end

# Criação de Jogadores em Campanhas
puts "Creating players in campaigns..."
campaigns_player = []
15.times do
  campaigns_player << CampaignsPlayer.create!(
    player_id: users.sample.id,
    campaign_id: campaigns.sample.id,
    )
end

# Criação de Personagens
puts "Creating characters..."
campaigns_player.each do |table|
  max_hp = Faker::Number.between(from: 10, to: 100)
  current_hp = Faker::Number.between(from: 1, to: 100) - max_hp

  character = Character.create!(
    player_id: table.player_id,
    campaigns_player: table,
    name: Faker::Name.name,
    level: Faker::Number.between(from: 1, to: 20),
    gender: Faker::Gender.binary_type,
    race: Faker::Games::DnD.race,
    first_class: Faker::Games::DnD.klass,
    first_class_level: Faker::Number.between(from: 1, to: 10),
    second_class: Faker::Games::DnD.klass,
    second_class_level: Faker::Number.between(from: 1, to: 10),
    subclass: Faker::Games::DnD.background,
    background: Faker::Games::DnD.background,
    strength: Faker::Number.between(from: 1, to: 20),
    dexterity: Faker::Number.between(from: 1, to: 20),
    constitution: Faker::Number.between(from: 1, to: 20),
    intelligence: Faker::Number.between(from: 1, to: 20),
    wisdom: Faker::Number.between(from: 1, to: 20),
    charisma: Faker::Number.between(from: 1, to: 20),
    max_hp: max_hp,
    current_hp: current_hp
  )

  table.update(character_id: character.id)
end

puts "Seed completed successfully!"
