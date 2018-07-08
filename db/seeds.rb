seeds = [
  "populate_users",
]

seeds.each { |seed| Rake::Task["db:seed:#{seed}"].invoke }