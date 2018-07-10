class QuestionDecorator < SimpleDelegator
  def user_name
    user.email
  end

  def simple_status
    I18n.t("questions.status.#{ status }")
  end
end