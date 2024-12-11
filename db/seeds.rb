Reservation.destroy_all
Pet.destroy_all
User.destroy_all

# Create Users
puts "Creating Users..."

eric = User.create!(nickname: "eric", email: "eric@me.ca", password: "test123", address: "2999 A. Jean-Noël-Lavoie, Laval, QC H7P 4K1", pet_sitter: true, price_per_day: 25, average_rating: 4, description: "Animal lover!")
eric.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/eric.jpg")), filename: "eric.jpg")
ashton = User.create!(nickname: "ashton", email: "ashton23@gmail.ca", password: "test123", address: "3131 A. Jean-Noël-Lavoie 440) Ouest, Laval, Quebec H7P 5P2", pet_sitter: true, price_per_day: 23, average_rating: 5, description: "Live,laugh & Learn")
ashton.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/ashton.jpg")), filename: "ashton.jpg")
alexa = User.create!(nickname: "alexa", address: "5333 Casgrain Ave Suite 102, Montreal, Quebec H2T 1X3", email: "alexa1212@gmail.com", password: "test123", pet_sitter: true, price_per_day: 30, description: "Experienced sitter with a love for dogs and cats.", average_rating: 4)
alexa.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/alexa.jpg")), filename: "alexa.jpg")
maria = User.create!(nickname: "maria", address: "3800 Queen Mary Rd, Montreal, Quebec H3V 1H6", email: "maria2542@gmail.com", password: "test123", pet_sitter: true, price_per_day: 32, description: "Professional pet sitter, happy to care for your pets while you're away!", average_rating: 5)
maria.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/maria.jpg")), filename: "maria.jpg")
chris = User.create!(nickname: "chris", address: "300 Rue Bridge, Montreal, Quebec H3K 2C3", email: "chris111@live.ca", password: "test123", pet_sitter: true, price_per_day: 29, description: "Animal lover and expert in handling all types of pets.", average_rating: 5)
chris.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/chris.jpg")), filename: "chris.jpg")
fatima = User.create!(nickname: "fatima", address: "1909 Av. des Canadiens-de-Montréal, Montréal, QC H3B 5E8", email: "fatima22@gmail.com", password: "test123", pet_sitter: true, price_per_day: 30, description: "Experienced in caring for all kinds of pets, I treat them like family!", average_rating: 4)
fatima.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/fatima.jpg")), filename: "fatima.jpg")
xiang_wei = User.create!(nickname: "xiang wei", email: "xiangwei77@hotmail.com", password: "test123", pet_sitter: true, price_per_day: 27, description: "Passionate about animals, I offer personalized care for your furry friends.", average_rating: 3)
xiang_wei.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/xiangwei.jpg")), filename: "xiangwei.jpg")

# Create Pets
puts "Creating Pets..."
bella = Pet.create!(name: "bella", species: "dog", description: "rotweiller", user: chris)
bella.image.attach(io: File.open(Rails.root.join("app/assets/images/pets/bella.jpg")), filename: "bella.jpg")
rocky = Pet.create!(name: "rocky", species: "dog", description: "red", user: fatima)
troy = Pet.create!(name: "troy", species: "dog", description: "Black and white", user: xiang_wei)
luna = Pet.create!(name: "luna", species: "cat", description: "brindled", user: eric)
luna.image.attach(io: File.open(Rails.root.join("app/assets/images/pets/luna.jpg")), filename: "luna.jpg")
felix = Pet.create!(name: "felix", species: "cat", description: "tabby", user: ashton)
felix.image.attach(io: File.open(Rails.root.join("app/assets/images/pets/felix.jpg")), filename: "felix.jpg")
buddy = Pet.create!(name: "buddy", species: "dog", description: "golden retriever", user: alexa)
milo = Pet.create!(name: "milo", species: "dog", description: "beagle", user: ashton)
oscar = Pet.create!(name: "oscar", species: "cat", description: "Smart cat", user: maria)
oscar.image.attach(io: File.open(Rails.root.join("app/assets/images/pets/oscar.jpg")), filename: "oscar.jpg")
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
  status: "pending",
  pets: [bella]
)

Reservation.create!(
  start_date: Date.today + 1.day,
  end_date: Date.today + 6.days,
  pet_owner: fatima,
  pet_sitter: maria,
  status: "pending",
  pets: [rocky]
)

Reservation.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 7.days,
  pet_owner: eric,
  pet_sitter: ashton,
  status: "pending",
  pets: [luna]
)

Reservation.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 5.days,
  pet_owner: eric,
  pet_sitter: eric,
  status: "pending",
  pets: [luna]
)

Reservation.create!(
  start_date: Date.today + 3.days,
  end_date: Date.today + 8.days,
  pet_owner: alexa,
  pet_sitter: maria,
  status: "pending",
  pets: [buddy]
)

Reservation.create!(
  start_date: Date.today + 4.days,
  end_date: Date.today + 9.days,
  pet_owner: xiang_wei,
  pet_sitter: maria,
  status: "pending",
  pets: [simba]
)

puts "Reservations have been successfully created with specific assignments!"
