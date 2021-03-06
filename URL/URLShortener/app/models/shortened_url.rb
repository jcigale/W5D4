# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  long_url     :string           not null
#  short_url    :string           not null
#  submitter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, :submitter_id, presence: true
    validates :short_url, presence: true, uniqueness: true
    
    def self.random_code
        loop do
            code = SecureRandom::urlsafe_base64
            return code unless ShortenedUrl.exists?(:short_url => code)
        end
    end

    def self.generate_short_url(user, long_url)
        ShortenedUrl.create!(:long_url => long_url, :short_url => self.random_code, :submitter_id => user.id)  
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :Visit

    has_many :visitors,
        Proc.new { distinct },
        through: :visits,
        source: :submitter

    def num_clicks
        self.visits.count
    end

    def num_uniques
        self.visitors.count
    end

    def num_recent_uniques
        self.visits.where(created_at < 10.minutes.ago).select(submitter_id).distinct.count
    end


end
