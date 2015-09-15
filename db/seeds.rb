admins = [
  { user_name: "bachdx",
    encrypted_password: "$2a$10$fLBwpa/3Q4NTQWZTJhOIZ.MXp6xNAWoszt76iHlfyA.woUEpaM3QG",
    role: "1" },
  { user_name: "thinhnv",
    encrypted_password: "$2a$10$fLBwpa/3Q4NTQWZTJhOIZ.MXp6xNAWoszt76iHlfyA.woUEpaM3QG",
    role: "1" }
]

admins.each do |admin|
  User.create! admin
end

heroes= [
 { name: "Abaddon", hero_type: Hero::STRENGTH, description: "abaddon created by bach ngu vcl", img_url: "abaddon.png"},
 { name: "Phoenix", hero_type: Hero::STRENGTH, description: "phoenix created by bach ngu vcl", img_url: "phoenix.png"},
 { name: "Akasha", hero_type: Hero::INTELLIGENT, description: "akasha created by bach ngu vcl", img_url: "akasha.png"},
 { name: "Kael", hero_type: Hero::INTELLIGENT, description: "kael created by bach ngu vcl", img_url: "kael.png"},
 { name: "Mirana", hero_type: Hero::AGILITY, description: "mirana created by bach ngu vcl", img_url: "mirana.png"},
 { name: "Phantom", hero_type: Hero::AGILITY, description: "phantom created by bach ngu vcl", img_url: "phantom.png"}
]

heroes.each do |hero|
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

divides.each do |divide|
  Divide.create! divide
end