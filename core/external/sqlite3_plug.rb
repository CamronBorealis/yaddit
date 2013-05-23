require 'sqlite3'

class Sqlite3Plug
	def initialize table_name
		@db = SQLite3::Database.new "db/development.sqlite3"
		@table_name = table_name
	end

	def list
		@db.execute("select * from " + @table_name)
	end

	def filter conditions
		@db.execute("select * from " + @table_name).select{|row| row[conditions.keys]}
	end
end