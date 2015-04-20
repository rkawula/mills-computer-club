require 'spec_helper'

describe UsersController do
	describe 'viewing user profiles' do

		# Set up each test case.
		before :each do
			@fake_user = [double('user')]
		end

		it 'should call the model to find that user' do
			User.should_receive(:find_by_id).with('1').and_return(@fake_user)
			get :show, {:user_id => 1}
		end

		describe 'after valid user' do

			before :each do
				User.stub(:find_by_id).and_return(@fake_user)
				get :show, {:user_id => 1}
			end

			it 'should render the Show template' do
				response.should render_template('show')
			end

			it 'should make the chosen user available to the view' do
				assigns(:user).should == @fake_user
			end

		end

		describe 'after invalid user' do

			before :each do
				User.stub(:find_by_id).and_return(nil)
				get :show, {:user_id => nil}
			end

			it 'should render the user index' do
				response.should redirect_to users_path
			end

			it 'should flash a user not found error' do
				flash[:notice].should_not be_nil
			end
			
		end
	end
end