
def setup_and_clear_test_database
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec('TRUNCATE TABLE accommodation, booking, users, availability;')
end

def load_test_accom
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec("INSERT INTO accommodation(id, name, description, location, price, host_id) VALUES(1, 'Cottage', 'The cottage is a contemporary, well equipped space a perfect romantic countryside escape.', 'London', 40, 1);")
  connection.exec("INSERT INTO accommodation(id, name, description, location, price, host_id) VALUES(2, 'Beach shack', 'A first floor apartment with spectacular views and bright and airy decor that echoes the sea in every room.', 'Cornwall', 60, 1);")
  connection.exec("INSERT INTO availability(accommodation_id, from_date, to_date) VALUES(1, '2020-09-29', '2020-12-31');")
  connection.exec("INSERT INTO availability(accommodation_id, from_date, to_date) VALUES(2, '2020-09-29', '2020-10-31');")
end

def persisted_data(id:)
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  result = connection.query("SELECT * FROM accommodation WHERE id = #{id};")
  result.first
end

def load_test_user
  connection = PG.connect("host=makersbnb.c4gsfvuzdyl3.eu-west-2.rds.amazonaws.com port=5433 user=postgres password=785njsjas88## dbname=makersbnb_test")
  connection.exec("INSERT INTO users (id, name, email, password) VALUES(1, 'test_name', 'test_email@email.com', '#{BCrypt::Password.create('password123')}') RETURNING id, name, email;")
end
