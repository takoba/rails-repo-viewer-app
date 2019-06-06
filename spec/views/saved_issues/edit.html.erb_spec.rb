require 'rails_helper'

RSpec.describe "saved_issues/edit", type: :view do
  before(:each) do
    @saved_issue = assign(:saved_issue, SavedIssue.create!(
      :user_name => "MyString",
      :repo_name => "MyString"
    ))
  end

  it "renders the edit saved_issue form" do
    render

    assert_select "form[action=?][method=?]", saved_issue_path(@saved_issue), "post" do

      assert_select "input[name=?]", "saved_issue[user_name]"

      assert_select "input[name=?]", "saved_issue[repo_name]"
    end
  end
end
