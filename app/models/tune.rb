class Tune < ApplicationRecord
    has_many :settings, dependent: :destroy

    accepts_nested_attributes_for :settings

    
    enum overall_rating: ["slow", "sluggish", "neutral", "decent", "fast", "unbeatable"], _prefix: :overall
end
