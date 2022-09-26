require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
      # to test that the user can be created if all fields are valid
    it 'Should create user when all fields are valid' do
      @user = User.new(
        name: 'testName',
        last_name: 'testLastName',
        email: '1@g.com',
        password: '123',
        password_confirmation: '123')

        @user.save

        expect(@user).to be_valid
      end

      # to test that password confirmation is working
      it 'should not create user if password does not match password confirmation ' do
        @user = User.new(
          name: 'testName',
          last_name: 'testLastName',
          email: '1@g.com',
          password: '123',
          password_confirmation: '0000')

          @user.save

          expect(@user).not_to be_valid
        end

        # to test that password should be 3 charac or more
        it 'should not create user if password is less than 3 characters ' do
          @user = User.new(
            name: 'testName',
            last_name: 'testLastName',
            email: '1@g.com',
            password: '1',
            password_confirmation: '1')

            @user.save
            expect(@user).not_to be_valid
            # expect(@user).to be_valid
          end
        # to test that email is required to create a user
          it 'should not create user if email is invalid' do
            @user = User.new(
              name: 'testName',
              last_name: 'testLastName',
              email: '',
              password: '111',
              password_confirmation: '111')

              @user.save

              expect(@user).not_to be_valid
            end
            # to test for duplicat users with the same email
            it 'should not create a new user if the email already exist even if its upper or lowercase ' do
              @user1 =
                User.new(
                  name: 'testName',
                  last_name: 'testLastName',
                  email: 'test@g.com',
                  password: '111',
                  password_confirmation: '111')

              @user1.save

              @user2 =
                User.new(
                  name: 'testName',
                  last_name: 'testLastName',
                  email: 'tesT@g.COM',
                  password: '111',
                  password_confirmation: '111')

              @user2.save

              expect(@user2).not_to be_valid
              #  expect(@user2).to be_valid
            end



  end
  describe '.authenticate_with_credentials' do

    it 'should login user after signup' do
      @user = User.new(
        name: 'testName',
        last_name: 'testLastName',
        email: '1@g.com',
        password: '123',
        password_confirmation: '123')

      @user.save

      loggedUser =
        User.authenticate_with_credentials(@user.email, @user.password)

      expect(loggedUser.id).to be (@user.id)
    end


    it 'should work if user added space when login' do
      @user =
        User.new(
        name: 'testName',
        last_name: 'testLastName',
        email: '1@g.com',
        password: '123',
        password_confirmation: '123')

      @user.save

      loggedUser =
        User.authenticate_with_credentials(
          '  1@g.com',
          @user.password,
        )

      expect(loggedUser.id).to be (@user.id)
    end

    it 'email fild should not be case sensitive' do
      @user =
        User.new(
          name: 'testName',
          last_name: 'testLastName',
          email: '1@g.com',
          password: '123',
          password_confirmation: '123')

      @user.save

      loggedUser =
        User.authenticate_with_credentials(
          '1@G.cOM',
          @user.password,
        )

      expect(loggedUser.id).to be (@user.id)
    end


  end


end