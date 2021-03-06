class Group < ActiveRecord::Base
    
   #  has_many :posts 
     has_many :posts, dependent: :destroy

     has_many :group_users
     has_many :members, through: :group_users, source: :user


     belongs_to :owner, class_name: "User", foreign_key: :user_id

      def editable_by?(user)
        user && user == owner
      end




	 validates :title, presence: true
end
