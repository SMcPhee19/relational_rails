require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should have_many :players }
  end


end

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
# ActiveRecord