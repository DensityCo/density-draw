require 'test_helper'

class QuestionTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_template = question_templates(:one)
  end

  test "should get index" do
    get question_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_question_template_url
    assert_response :success
  end

  test "should create question_template" do
    assert_difference('QuestionTemplate.count') do
      post question_templates_url, params: { question_template: { prompt: @question_template.prompt } }
    end

    assert_redirected_to question_template_url(QuestionTemplate.last)
  end

  test "should show question_template" do
    get question_template_url(@question_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_template_url(@question_template)
    assert_response :success
  end

  test "should update question_template" do
    patch question_template_url(@question_template), params: { question_template: { prompt: @question_template.prompt } }
    assert_redirected_to question_template_url(@question_template)
  end

  test "should destroy question_template" do
    assert_difference('QuestionTemplate.count', -1) do
      delete question_template_url(@question_template)
    end

    assert_redirected_to question_templates_url
  end
end
