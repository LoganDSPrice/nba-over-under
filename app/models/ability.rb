# class Ability
#   include CanCan::Ability

#   attr_reader :user

#   def initialize(user)
#     @user = user
#     send(@user.role)
#   end

#   def super_admin
#     can :manage, :all
#   end

#   def org_admin
#     can :read, Organization, active: true, id: user.organization_id
#     can :manage, User
#     can :manage, UserAssessment
#     can :preview, OrganizationsProgram, organization: { id: user.organization_id }
#     can :initiate, OrganizationsProgram
#     can :manage, Goal
#     can :manage, BehaviorTracking
#     can :manage, BehaviorTrackingPreference, user: user
#     can :manage, :behavior_tracking_setup
#   end

#   def manager
#     can :manage, Goal
#     can :manage, BehaviorTracking
#     can :manage, OrganizationsProgram, organization: { id: user.organization_id }
#     can :manage, BehaviorTrackingPreference, user: user
#     can :manage, :behavior_tracking_setup
#   end

# end