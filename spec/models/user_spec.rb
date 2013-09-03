require 'spec_helper'

describe User do
	before { @user = User.new(name: 'gautam', email: 'gautam@moontara.com')}
	subject { @user }

	it { should respond_to(:name)}
	it { should respond_to(:email)}
	it {should be_valid}



	describe "when name is not present" do
		before { @user.name = ""}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before { @user.email = ""}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before do 	
			@user.name = "a" * 51
		end
		it {should_not be_valid}
	end


	describe "when email is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
				foo@bar_baz.com foo@bar+baz.com]	
				
				addresses.each do |invalid_address|
					@user.email = invalid_address
					expect(@user).not_to be_valid
				end
			end

		end

end
