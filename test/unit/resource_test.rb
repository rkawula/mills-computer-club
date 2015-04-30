# == Schema Information
#
# Table name: resources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  question   :string(255)
#  answer     :text
#  url        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
