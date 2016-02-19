module ApplicationHelper
	
	def formata_preco price
		number_to_currency(price, unit: "R$", separator: ",", delimiter: "")
	end
end
