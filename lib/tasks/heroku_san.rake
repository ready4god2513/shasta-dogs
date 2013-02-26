require 'heroku_san'

class MyStrategy < HerokuSan::Deploy::Base
  def deploy
    puts "Using custom Heroku deploy strategy."
    puts
    Rake::Task['heroku:maintenance_on'].invoke
    puts "Maintenance mode enabled."

    super

    @stage.run('rake db:reload')

    Rake::Task['heroku:maintenance_off'].invoke
    puts "Maintenance mode disabled."
    puts "Done."
  end
end

HerokuSan.project = HerokuSan::Project.new(Rails.root.join("config", "heroku.yml"), :deploy => MyStrategy)