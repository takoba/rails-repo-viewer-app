require 'rails_helper'

RSpec.describe "saved_issues/show", type: :view do
  before(:each) do
    @saved_issue = assign(:saved_issue, SavedIssue.create!(
      :user_name => "User Name",
      :repo_name => "Repo Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Repo Name/)
  end
end
