Reservation.destroy_all
Pet.destroy_all
User.destroy_all

# Create Users
puts "Creating Users..."
eric = User.create!(nickname: "eric", email: "eric@test.ca", password: "test123", pet_sitter: false)
ashton = User.create!(nickname: "ashton", email: "ashton@test.ca", password: "test123", pet_sitter: false)
alexa = User.create!(nickname: "alexa", address: "5333 Casgrain Ave Suite 102, Montreal, Quebec H2T 1X3", email: "alexa@test.ca", password: "test123", pet_sitter: true, description: "Experienced sitter with a love for dogs and cats.")
alexa.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/alexa.jpg")), filename: "alexa.jpg")
maria = User.create!(nickname: "maria", address: "3800 Queen Mary Rd, Montreal, Quebec H3V 1H6", email: "maria@test.ca", password: "test123", pet_sitter: true, description: "Professional pet sitter, happy to care for your pets while you're away!")
maria.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/maria.jpg")), filename: "maria.jpg")
chris = User.create!(nickname: "chris", address: "300 Rue Bridge, Montreal, Quebec H3K 2C3", email: "chris@test.ca", password: "test123", pet_sitter: true, description: "Animal lover and expert in handling all types of pets.")
chris.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/chris.jpg")), filename: "chris.jpg")
fatima = User.create!(nickname: "fatima", address: "1909 Av. des Canadiens-de-Montréal, Montréal, QC H3B 5E8", email: "fatima@test.ca", password: "test123", pet_sitter: true, description: "Experienced in caring for all kinds of pets, I treat them like family!")
fatima.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/fatima.jpg")), filename: "fatima.jpg")
xiang_wei = User.create!(nickname: "xiang wei", email: "xiangwei_sitter@test.ca", password: "test123", pet_sitter: true, description: "Passionate about animals, I offer personalized care for your furry friends.")
xiang_wei.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/xiangwei.jpg")), filename: "xiangwei.jpg")

# Create Pets
puts "Creating Pets..."
bella = Pet.create!(name: "bella", species: "dog", description: "brown", user: chris)
rocky = Pet.create!(name: "rocky", species: "dog", description: "red", user: fatima)
troy = Pet.create!(name: "troy", species: "dog", description: "Black and white", user: xiang_wei)
luna = Pet.create!(name: "luna", species: "cat", description: "white", user: eric)
felix = Pet.create!(name: "felix", species: "cat", description: "tabby", user: ashton)
buddy = Pet.create!(name: "buddy", species: "dog", description: "golden retriever", user: alexa)
milo = Pet.create!(name: "milo", species: "dog", description: "beagle", user: ashton)
oscar = Pet.create!(name: "oscar", species: "cat", description: "black", user: maria)
simba = Pet.create!(name: "simba", species: "cat", description: "lion look-alike", user: xiang_wei)
rocky_chris = Pet.create!(name: "rocky", species: "dog", description: "rottweiler", user: chris)
rosie = Pet.create!(name: "rosie", species: "cat", description: "persian", user: fatima)

# ashton = User.create!(
#   nickname: "ashton",
#   first_name: "ashton",
#   last_name: "todasco",
#   email: "ashton@test.ca",
#   password: "test123",
#   pet_sitter: true,
#   address: "5333 Casgrain Ave Suite 102, Montreal, Quebec H2T 1X3",
#   description: "Ashton is a 2 year old little boy who loves all animals. He would love to be a pet sitter!"
# )

puts "Pets have been successfully created with specific user assignments!"

# Create Reservations
puts "Creating Reservations..."
Reservation.create!(
  start_date: Date.today,
  end_date: Date.today + 5.days,
  pet_owner: chris,
  pet_sitter: alexa,
  pets: [bella]
)

Reservation.create!(
  start_date: Date.today + 1.day,
  end_date: Date.today + 6.days,
  pet_owner: fatima,
  pet_sitter: maria,
  pets: [rocky]
)

Reservation.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 7.days,
  pet_owner: eric,
  pet_sitter: chris,
  pets: [luna]
)

Reservation.create!(
  start_date: Date.today + 3.days,
  end_date: Date.today + 8.days,
  pet_owner: alexa,
  pet_sitter: maria,
  pets: [buddy]
)

Reservation.create!(
  start_date: Date.today + 4.days,
  end_date: Date.today + 9.days,
  pet_owner: xiang_wei,
  pet_sitter: maria,
  pets: [simba]
)

puts "Reservations have been successfully created with specific assignments!"
