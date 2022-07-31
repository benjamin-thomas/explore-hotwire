def seed_for_development!
  fail if !Rails.env.development?

  print "Reset the development database? (y/N) "
  answer = STDIN.gets.chomp
  if answer.upcase != "Y"
    warn "Abort!"
    exit 0
  end
  warn "--> Recreating the database and seeding from fixtures..."
  system "bin/rails db:drop db:create db:migrate db:fixtures:load"
end

case Rails.env
when 'development'
  seed_for_development!
else
  warn 'NOOP!'
end