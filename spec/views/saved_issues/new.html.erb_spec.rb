require 'rails_helper'

RSpec.describe "saved_issues/new", type: :view do
  before(:each) do
    assign(:saved_issue, SavedIssue.new(
      :user_name => "MyString",
      :repo_name => "MyString"
    ))
  end

  it "renders new saved_issue form" do
    render

    assert_select "form[action=?][method=?]", saved_issues_path, "post" do

      assert_select "input[name=?]", "saved_issue[user_name]"

      assert_select "input[name=?]", "saved_issue[repo_name]"
    end
  end
end
