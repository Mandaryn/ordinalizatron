require 'ordinalize'
require 'activerecord'

RSpec.configure do |config|
  config.mock_with :rspec
end

def setup_database
  root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "#{root}/ordinalize.db")
  ActiveRecord::Base.connection.create_table(:posts) do |t|
    t.string :value
  end
end

def cleanup_database
  ActiveRecord::Base.connection.drop_table(:posts)
end
