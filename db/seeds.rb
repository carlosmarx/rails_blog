puts 'Seding daatabases...'

load(Rails.root.join('db', 'seeds', "#{Rails.env.downcase}.rb"))
