PetReservation.destroy_all
Reservation.destroy_all
Pet.destroy_all
User.destroy_all

eric = User.create!(
  nickname: "eric",
  first_name: "eric",
  last_name: "todasco",
  email: "eric@test.ca",
  password: "test123"
)

ashton = User.create!(
  nickname: "ashton",
  first_name: "ashton",
  last_name: "todasco",
  email: "ashton@test.ca",
  password: "test123",
  pet_sitter: true,
  address: "5333 Casgrain Ave Suite 102, Montreal, Quebec H2T 1X3"
)

bella = Pet.create!(
  name: "bella",
  species: "dog",
  description: "brown",
  checklist: "",
  user: eric
)

rocky = Pet.create!(
  name: "rocky",
  species: "dog",
  description: "red",
  checklist: "",
  user: eric
)

troy = Pet.create!(
  name: "troy",
  species: "dog",
  description: "Black and white",
  checklist: "",
  user: eric
)

reservation1 = Reservation.new(
  status: "pending",
  start_date: Date.today,
  end_date: Date.today + 1,
)

reservation1.pet_owner = eric
reservation1.pet_sitter = ashton
reservation1.save

petreservation1 = PetReservation.new()
petreservation1.pet = bella
petreservation1.reservation = reservation1
petreservation1.save

