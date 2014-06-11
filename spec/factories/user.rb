FactoryGirl.define do
	factory(:user) do
		
		first_name "William"
		last_name "Dyer"
		email "BillyD@exmaple.com"
		password "qwerty"
		password_confirmation "qwerty"
		role_id 1
		user_name "Madmouth"
		description "Loves geology, hates old ones"
	end

	factory :invalid_user, class: User do 
		user_name nil
		email "invalid@example.com"
	end
end


