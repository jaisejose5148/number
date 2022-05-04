class UserPhnnumbersController < ApplicationController
	def insert_number
		if params[:number].present?
		@exit_user = User.find_by_name(params[:name])
		
		if @exit_user.nil?
			render json: "user with this name does not exits please enter the a valid user name" 
		else
			 @phn_number = phone_number_validation(params[:number])
			puts"=====bbbbb==="+@phn_number.inspect
		 if !@phn_number.nil? 
		 	number_test = number_present(@phn_number)
		 	#puts"====number_test in given===="+number_test.inspect
		 	if number_test.nil?
		 	phnnumber_user = UserPhnnumber.create(user_id: @exit_user.id ,number: @phn_number) 
		 	render json: phnnumber_user

		  end
		 end
	   end
      else
      	user_number_generation(params[:name])
      end


	end

     def user_number_generation(name)
     	@exit_user = User.find_by_name(params[:name])
		
		if @exit_user.nil?
			render json: "user with this name does not exits please enter the a valid user name" 
		else
			@new_number = 10.times.map{rand(10)}.join
			random_number_user = UserPhnnumber.create(user_id: @exit_user.id ,number: @new_number) 
		 	render json: random_number_user
		end
     end


    
    def number_present(phnumber)
    	@number_test = UserPhnnumber.find_by_number(phnumber)
    	puts"===number_test====="+@number_test.inspect
    	if !@number_test.nil?
    		render json: "This Number is alredy assigned for a user"
    	else
    		@number_test = @number_test
    	end
    	return @number_test
    end

	def details
		render json: "saved followed user"
	end


	def phone_number_validation(phn_number)
		#@phn_number = phn_number
	if phn_number.is_a? Integer 
      if phn_number.to_s.length == 10
		#render json: "valid phone number"
		@phn_number = phn_number
	else
		puts"=====bbbbb=djhhh=="
		render json: "number must be 10 digit"
	end
	else
		render json: "invalid phone number"
	end
	return @phn_number
	
	end

	def index
		@user_number_all = UserPhnnumber.all
		render json: @user_number_all
	end

	private
   
  def number_params
    params.require(:user_phnnumber).permit(:name,:number)
  end 
end
