require "application_system_test_case"

class QuestionTemplatesTest < ApplicationSystemTestCase
  setup do
    @question_template = question_templates(:one)
  end

  test "visiting the index" do
    visit question_templates_url
    assert_selector "h1", text: "Question Templates"
  end

  test "creating a Question template" do
    visit question_templates_url
    click_on "New Question Template"

    fill_in "Prompt", with: @question_template.prompt
    click_on "Create Question template"

    assert_text "Question template was successfully created"
    click_on "Back"
  end

  test "updating a Question template" do
    visit question_templates_url
    click_on "Edit", match: :first

    fill_in "Prompt", with: @question_template.prompt
    click_on "Update Question template"

    assert_text "Question template was successfully updated"
    click_on "Back"
  end

  test "destroying a Question template" do
    visit question_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question template was successfully destroyed"
  end
end
