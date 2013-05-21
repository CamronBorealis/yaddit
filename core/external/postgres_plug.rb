require 'pg'

class PostgresPlug
	def runTest
		conn = PG.connect(ENV['DATABASE_URL'])
		conn.exec
	end
end