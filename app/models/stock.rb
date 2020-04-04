class Stock < ApplicationRecord

	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_publishable_token],
																  secret_token: Rails.application.credentials.iex_client[:sandbox_secret_token],
																  endpoint: 'https://sandbox.iexapis.com/v1')
		begin
			company = client.company(ticker_symbol)
			price = client.price(ticker_symbol)
			new(ticker: ticker_symbol, name: company.company_name, last_price: price)
		rescue => exception
			return nil
		end
		
	end
end
