require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a valid user successfully' do
      
      @user = User.new(
        name: 'Bob',
        email: 'bob@example.com',
        password: 'password',
        password_confirmation: 'password' 
      )

      expect(@user).to be_valid
    end

    it 'should not be valid if name is blank' do

      @user = User.new(
        name: nil,
        email: 'bob@example.com',
        password: 'password',
        password_confirmation: 'password' 
      )

      expect(@user).to_not be_valid
    end

    it 'should not be valid if email is blank' do

      @user = User.new(
        name: 'bob',
        email: nil,
        password: 'password',
        password_confirmation: 'password' 
      )

      expect(@user).to_not be_valid
    end

    it 'should not be valid if password is blank' do

      @user = User.new(
        name: 'bob',
        email: 'bob@example.com',
        password: nil,
        password_confirmation: 'password' 
      )

      expect(@user).to_not be_valid
    end

    it 'should not be valid if password_confirmation is blank' do

      @user = User.new(
        name: 'bob',
        email: 'bob@example.com',
        password: 'password',
        password_confirmation: nil 
      )

      expect(@user).to_not be_valid
    end

    it 'should not save a user if password and password confirmation do not match' do 
      @user = User.new(
        name:'bob',
        email:'bob@example.com',
        password:'PASSWORD',
        password_confirmation:'password'
      )

        expect(@user).to_not be_valid
    end

    it ('should not save a user with the same case sensitive email') do
        @user = User.create(
          name:'bob',
          email:'bob@example.com',
          password:'password',
          password_confirmation:'password'
        )

        @test_user = User.new(
          name:'bob',
          email:'BOB@EXAMPLE.COM',
          password:'password',
          password_confirmation:'password'
        )

        expect(@test_user).to_not be_valid
    end

    it ('should let user save if password length is less than 8 characters long') do
      @user = User.new(
        name:'bob',
        email:'BOB@EXAMPLE.COM',
        password:'pass',
        password_confirmation:'pass'
      )

      expect(@user).to_not be_valid
    end

    describe ".authenticate_with_credentials" do
      it "should return a User instance when credentials are authenitcated" do
        @user = User.new(
          name: "Joe Bloe",
          email: "joe@bloe.ca",
          password: "password",
          password_confirmation: "password"
        )
  
        @user.save!
  
        expect(@user).to eq(User.authenticate_with_credentials("joe@bloe.ca", "password"))
      end
  
      it "should authenticate email regardless of case or leading/trailing white space" do
        @user = User.new(
          name: "Joe Bloe",
          email: "joe@bloe.ca",
          password: "password",
          password_confirmation: "password"
        )
  
        @user.save!
  
        expect(@user).to eq(User.authenticate_with_credentials("  JOE@bloe.ca  ", "password"))
      end
  
      it "should fail authentication when given the wrong email" do
        @user = User.new(
          name: "Joe Bloe",
          email: "joe@bloe.ca",
          password: "password",
          password_confirmation: "password"
        )
  
        @user.save!
  
        expect(User.authenticate_with_credentials("joseph@bloe.ca", "notpassword")).to eq(nil)
      end
  
      it "should fail authentication when given the wrong password" do
        @user = User.new(
          name: "Joe Bloe",
          email: "joe@bloe.ca",
          password: "password",
          password_confirmation: "password"
        )
  
        @user.save!
  
        expect(User.authenticate_with_credentials("joe@bloe.ca", "notpassword")).to eq(nil)
      end
    end
  end
end
