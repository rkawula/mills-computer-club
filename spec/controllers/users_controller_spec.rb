require 'spec_helper'

describe UsersController do
	describe 'viewing user profiles' do

		it 'should call the model to find that user' do
			@fake_user = [double('user')]

			User.should_receive(:find_by_id).with('1').and_return(@fake_user)

			get :show, {:user_id => 1}

			assigns(:user).should == @fake_user
		end

		it 'should render the Show template' do
			@fake_user = [double('user')]
			User.stub(:find_by_id).and_return(@fake_user)

			get :show, {:user_id => 1}
			response.should render_template('show')
		end

	end
end