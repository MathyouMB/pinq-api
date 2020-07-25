  
alias Pinq.Repo
alias Pinq.Reminders.Reminder

Repo.insert! %Reminder{
  name: "Person1",
  description: "gotta replyy this guyyy mannn",
  status: "initial",
  time: ~N[2014-10-02 00:29:12],
  user_id: 1
}

Repo.insert! %Reminder{
    name: "Person2",
    description: "gotta replyy this guyyy mannn",
    status: "initial",
    time: ~N[2014-10-02 00:29:12],
    user_id: 1
}

Repo.insert! %Reminder{
    name: "Person3",
    description: "gotta replyy this guyyy mannn",
    status: "initial",
    time: ~N[2014-10-02 00:29:12],
    user_id: 2
}

Repo.insert! %Reminder{
    name: "Person4",
    description: "gotta replyy this guyyy mannn",
    status: "initial",
    time: ~N[2014-10-02 00:29:12],
    user_id: 2
}