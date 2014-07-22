class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  scope :for_user_and_wiki, -> (user, wiki) { where(user_id: user.id, wiki_id: wiki.id) }
end
