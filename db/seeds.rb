User.create!(user_name: "bachdx",
              encrypted_password: "$2a$10$fLBwpa/3Q4NTQWZTJhOIZ.MXp6xNAWoszt76iHlfyA.woUEpaM3QG",
              role: "1")

heroes= [
 { name: "Abaddon", hero_type: Hero::STRENGTH, description: "abaddon created by thinh ngu vcl", img_url: "abaddon.jpg"}
]

heroes.each do |hero|
  Rails.logger.debug hero
  Hero.create! hero
end

divides = [
  { name: "Base" },
  { name: "Green" },
  { name: "Green + 1" },
  { name: "Blue" },
  { name: "Blue + 1" },
  { name: "Blue + 2" },
  { name: "Purple" },
  { name: "Purple + 1" },
  { name: "Purple + 2" },
  { name: "Purple + 3" },
  { name: "Purple + 4" },
  { name: "Golden" }
]

divides.each do |devide|
  Divide.create! divide
end