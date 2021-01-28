# == Schema Information
#
# Table name: visits
#
#  id           :bigint           not null, primary key
#  url_id       :integer          not null
#  submitter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Visit < ApplicationRecord
    validates :url_id, :submitter_id, presence: true

    belongs_to :short_url,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :ShortenedUrl

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User

    def self.record_visit!(user, shortened_url)
        Visit.create!(url_id: shortened_url.id, submitter_id: user.id)
    end
end
