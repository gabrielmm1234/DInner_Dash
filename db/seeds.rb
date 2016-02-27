# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Profile.delete_all
Profile.create! id: 1, name: "Administrador"
Profile.create! id: 2, name: "Usuario"

User.delete_all
User.create! first_name: "Khalil", email: "khalilcarsten@hotmail.com", profile_id: 1, password: "12345678"
User.create! first_name: "Mesquita", email: "mesquita@hotmail.com", profile_id: 1, password: "12345678"
User.create! first_name: "Jose", email: "jose@hotmail.com", profile_id: 1, password: "12345678"
User.create! first_name: "Teste", email: "teste@hotmail.com", profile_id: 2, password: "12345678"

Category.delete_all
a_category = [	{name: "Pratos frios"},
				{name: "Pratos quentes"},
				{name: "Entrada"}, 
				{name: "Saladas"},
				{name: "Sobremesas"}, 
				{name: "Bebidas"}]
categorias = Category.create(a_category)

pf = categorias[0].id
pq = categorias[1].id
en = categorias[2].id
sa = categorias[3].id
so = categorias[4].id
be = categorias[5].id

Item.delete_all
a_item = [	{Name: "Macarrao", Description: "Muito bom", Price: 22.50, category_ids: pq},
			{Name: "Carpaccio", Description: "Caro pra porra", Price: 50.40, category_ids: pf},
			{Name: "Batata Frita", Description: "Perfeito", Price: 18.99, category_ids: en},
			{Name: "Salada Gay", Description: "Coisa de vegetariano", Price: 10.50, category_ids: sa},
			{Name: "Sorvete", Description: "Engorda", Price: 5.99, category_ids: so},
			{Name: "Cerveja", Description: "Meu deus", Price: 4.99, category_ids: be}]
Item.create(a_item)