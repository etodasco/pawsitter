Reservation.destroy_all
Pet.destroy_all
User.destroy_all


eric = User.create!(
  nickname: "eric",
  email: "eric@test.ca",
  password: "test123",
  pet_sitter: false
)

ashton = User.create!(
  nickname: "ashton",
  email: "ashton@test.ca",
  password: "test123",
  pet_sitter: false
)


alexa = User.create!(
  nickname: "alexa",
  email: "alexa@test.ca",
  password: "test123",
  pet_sitter: true,
  description: "Experienced sitter with a love for dogs and cats."
)
alexa.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/alexa.jpg")), filename: "alexa.jpg")

maria = User.create!(
  nickname: "maria",
  email: "maria@test.ca",
  password: "test123",
  pet_sitter: true,
  description: "Professional pet sitter, happy to care for your pets while you're away!"
)
maria.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/maria.jpg")), filename: "maria.jpg")

chris = User.create!(
  nickname: "chris",
  email: "chris@test.ca",
  password: "test123",
  pet_sitter: true,
  description: "Animal lover and expert in handling all types of pets."
)
chris.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/chris.jpg")), filename: "chris.jpg")

fatima = User.create!(
  nickname: "fatima",
  email: "fatima@test.ca",
  password: "test123",
  pet_sitter: true,
  description: "Experienced in caring for all kinds of pets, I treat them like family!"
)
fatima.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/fatima.jpg")), filename: "fatima.jpg")

xiangwei_sitter = User.create!(
  nickname: "xiang wei22",
  email: "xiangwei_sitter@test.ca",
  password: "test123",
  pet_sitter: true,
  description: "Passionate about animals, I offer personalized care for your furry friends."
)
xiangwei_sitter.image.attach(io: File.open(Rails.root.join("app/assets/images/petsitters/xiangwei_sitter.jpg")), filename: "xiangwei_sitter.jpg")



bella = Pet.create!(
  name: "bella",
  species: "dog",
  description: "brown",
  checklist: "",
  pet_owner: eric
)

rocky = Pet.create!(
  name: "rocky",
  species: "dog",
  description: "red",
  checklist: "",
  pet_owner: eric
)

troy = Pet.create!(
  name: "troy",
  species: "dog",
  description: "Black and white",
  checklist: "",
  pet_owner: eric
)


luna = Pet.create!(
  name: "luna",
  species: "cat",
  description: "white",
  checklist: "",
  pet_owner: ashton
)

felix = Pet.create!(
  name: "felix",
  species: "cat",
  description: "tabby",
  checklist: "",
  pet_owner: ashton
)


buddy = Pet.create!(
  name: "buddy",
  species: "dog",
  description: "golden retriever",
  checklist: "",
  pet_owner: sophia
)

milo = Pet.create!(
  name: "milo",
  species: "dog",
  description: "beagle",
  checklist: "",
  pet_owner: sophia
)


oscar = Pet.create!(
  name: "oscar",
  species: "cat",
  description: "black",
  checklist: "",
  pet_owner: james
)

simba = Pet.create!(
  name: "simba",
  species: "cat",
  description: "lion look-alike",
  checklist: "",
  pet_owner: james
)


rocky_lucas = Pet.create!(
  name: "rocky",
  species: "dog",
  description: "rottweiler",
  checklist: "",
  pet_owner: lucas
)

rosie = Pet.create!(
  name: "rosie",
  species: "cat",
  description: "persian",
  checklist: "",
  pet_owner: lucas
)


Reservation.create!(
  pet: bella,
  start_date: Date.today,
  end_date: Date.today + 5.days,
  pet_sitter: alex
)

Reservation.create!(
  pet: rocky,
  start_date: Date.today + 1.day,
  end_date: Date.today + 6.days,
  pet_sitter: maria
)

Reservation.create!(
  pet: luna,
  start_date: Date.today + 2.days,
  end_date: Date.today + 7.days,
  pet_sitter: chris
)

Reservation.create!(
  pet: buddy,
  start_date: Date.today + 3.days,
  end_date: Date.today + 8.days,
  pet_sitter: alex
)

Reservation.create!(
  pet: simba,
  start_date: Date.today + 4.days,
  end_date: Date.today + 9.days,
  pet_sitter: maria
)
