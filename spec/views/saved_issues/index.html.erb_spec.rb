require 'rails_helper'

RSpec.describe "saved_issues/index", type: :view do
  before(:each) do
    assign(:saved_issues, [
      SavedIssue.create!(
        :user_name => "User Name",
        :repo_name => "Repo Name"
      ),
      SavedIssue.create!(
        :user_name => "User Name",
        :repo_name => "Repo Name"
      )
    ])
  end

  it "renders a list of saved_issues" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Repo Name".to_s, :count => 2
  end
end
