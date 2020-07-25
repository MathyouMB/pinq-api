  
alias Pinq.Repo
alias Pinq.Reminders.User

Repo.insert! %User{
  username: "Matthew",
  email: "matthew@email.com",
  password: "1234"
}

Repo.insert! %User{
  username: "Tiffany",
  email: "tiffany@email.com",
  password: "1234"
}