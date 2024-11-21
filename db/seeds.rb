## Cleaning all entities
Task.delete_all
User.delete_all

## Criar users

murileonsio = User.create!(
  email: "murileonsio@gmail.com",
  name: "Murileonsio",
)

alveta = User.create!(
  email: "alveta@gmail.com",
  name: "Alveta",
)

### Tasks 

task1 = Task.create!(
  title: "Comprar leite",
  coins: 2,
  user: murileonsio
)
task2 = Task.create!(
  title: "Comprar pao",
  coins: 3,
  user: alveta
)
Task.create!(
  title: "Comprar açucar",
  coins: 2
)
Task.create!(
  title: "Comprar pêra",
  coins: 7
)
Task.create!(
  title: "Comprar amendoa",
  coins: 5
)
Task.create!(
  title: "Comprar lentilha",
  coins: 3
)




## Creating users coins

murileonsio.coins = 2205
alveta.coins = 1803

murileonsio.save
alveta.save