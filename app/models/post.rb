class Post < ApplicationRecord
    belongs_to :user

    validates :title, :author, :body, presence: true
    validates :body, length: {minimum:25, maximum:255}

end
