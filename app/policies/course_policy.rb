class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  
  def show?

    @user.present? && @user.has_role?(:admin) ||
    @user.present? && @record.user_id == @user.id ||
    @user.present? && @record.bought(@user)
  

  end
  
  def edit?
    @record.user == @user
  end



  def update?
    @record.user == @user
  end



  def new?
    @user.has_role?(:teacher)
  end



  def create?
    @user.has_role?(:teacher)
  end



  def destroy?
    @record.user == @user
  end
  
end
