# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # ログインしているかつadminカラムがtrueの場合
   if user && user.admin?
    # rails_adminへのアクセスを許可
      can :access, :rails_admin
    # 全ての機能を使えるように設定
      can :manage, :all# Define abilities for the user here. For example:
    
   elsif user.has_role?(:customer)
      can :read, :all # customerユーザーには読み取り操作を許可
    #   return unless user.present?
    #   return unless user.admin?
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
   end
  end
end
