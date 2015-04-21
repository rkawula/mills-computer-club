require 'spec_helper'

describe UsersController do

	describe 'viewing user profiles' do
		# Set up each test case.
		before :each do
			@fake_user = [double('user')]
		end
		it 'should call the model to find that user' do
			User.should_receive(:find_by_id).with('1').and_return(@fake_user)
			get :show, {:id => 1}
		end

		describe 'after valid user' do
			before :each do
				User.stub(:find_by_id).and_return(@fake_user)
				get :show, {:id => 1}
			end
			it 'should render the Show template' do
				response.should render_template('show')
			end
			it 'should make the chosen user available to the view' do
				assigns(:user).should == @fake_user
			end
		end

		describe 'after trying to view an invalid user' do
			before :each do
				User.stub(:find_by_id).and_return(nil)
				get :show, {:id => nil}
			end
			it 'should render the user index' do
				response.should redirect_to users_path
			end
			it 'should flash a user not found error' do
				flash[:notice].should_not be_nil
			end
		end
	end

	describe 'editing a user profile' do

		describe 'if user is not logged in' do
			before :each do
				get :profile, {:current_user => nil}
			end

			it 'should flash an error message' do
				flash[:notice].should_not be_nil
			end

			it 'should redirect to the users list' do
				response.should redirect_to users_path
			end
		end

		describe 'if user is logged in' do
			before :each do
				User.stub(:current_user).and_return(nil)
				get :profile
			end
			it 'should not show an error if the user is logged in' do
				flash[:notice].should be_nil
			end
			it 'should render the Profile template' do
				response.should render_template('profile')
			end
		end

	end

end