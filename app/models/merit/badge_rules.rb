# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize

      grant_on 'proud_messages#create',  badge: 'Jr.Contributor', to: :user do |proud_message|
        proud_message.user.proud_messages.count >= 10 &&  proud_message.proud_messages.comments.count < 50
      end

      grant_on 'proud_messages#create',  badge: 'Sr.Contributor', to: :user do |proud_message|
        proud_message.user.proud_messages.count >= 50
      end

      grant_on 'comments#create',  badge: 'Jr.Critic', to: :user do |comment|
        comment.user.comments.count >= 10 &&  comment.user.comments.count < 50
      end

      grant_on 'comments#create',  badge: 'Sr.Critic', to: :user do |comment|
        comment.user.comments.count >= 50
      end

    end
  end
end
