require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  profile          :string(255)
#  admin            :boolean         default(FALSE), not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

