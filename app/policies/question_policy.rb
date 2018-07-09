class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def index?
    user.present?
  end

  def show?
    user.admin? || record.user_id == user.id
  end

  def create?
    user.present?
  end

  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end

  def analyses?
    admin_and_pending_question?
  end

  def approve?
    admin_and_pending_question? && !record.approved_at?
  end

  private

  def admin_and_pending_question?
    user.admin? && record.pending_at?
  end
end
