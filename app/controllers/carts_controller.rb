class CartsController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end

	def show
		@cart = Cart.find_by(user: current_user)
		# @total = @cart.cart_products.map {|product| product.total}.sum.to_i
		@cart.update(total: @total)
		@products = @cart.products
	end

	def destroy
		puts '########### destroy cart controller (destroy cart_products) ##############'
		if current_user.cart.cart_products.destroy_all
			respond_to do |format|
				format.html {redirect_to cart_path(current_user.cart.id)}
				format.js
			end
		end
	end
end