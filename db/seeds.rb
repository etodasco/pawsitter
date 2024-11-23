Reservation.destroy_all
Pet.destroy_all
User.destroy_all

eric = User.create!(
  nickname: "eric",
  email: "eric@test.ca",
  password: "test123"
)

ashton = User.create!(
  nickname: "ashton",
  email: "ashton@test.ca",
  password: "test123"
)

Pet.create!(
  name: "bella",
  species: "dog",
  description: "brown",
  checklist: "",
  user: eric
)

Pet.create!(
  name: "rocky",
  species: "dog",
  description: "red",
  checklist: "",
  user: eric
)

Pet.create!(
  name: "troy",
  species: "dog",
  description: "Black and white",
  checklist: "",
  user: eric
)