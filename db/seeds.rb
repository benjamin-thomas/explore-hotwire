def seed_for_development!
  fail if !Rails.env.development?

  warn "--> Recreating the database..."
  system "./bin/rails db:drop db:create db:migrate"

  warn "--> Seeding from fixtures..." # must happen in another process, after db:migrate
  system "./bin/rails db:fixtures:load"
end

case Rails.env
when 'development'
  seed_for_development!
else
  warn 'NOOP!'
end