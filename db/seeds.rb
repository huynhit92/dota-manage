heroes= [
 { name: "Abaddon", hero_type: Hero::STRENGTH, description: "abaddon created by thinh ngu vcl", img_url: "abaddon.png"}
]

heroes.each do |hero|
  Rails.logger.debug hero
  Hero.create! hero
end