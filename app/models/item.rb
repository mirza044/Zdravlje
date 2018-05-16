class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    serialize :image, JSON #if you use SQLite, add this line
    belongs_to :user, optional: true

    validates :title, :price, presence: true
    validates :description, length: { maximum: 1000, too_long: "dovoljeno je maksimalno %{count} karakterta. "}
    validates :title, length: { maximum: 140, too_long: "dovoljeno je maksimalno %{count} karakterta. "}
    validates :price, numericality: { only_integer: true }, length: { maximum: 7 }
    #validates :type, length: { maximum: 140, too_long: "dovoljeno je maksimalno %{count} karakterta. "}

    #TYPE = %w{ Sok Voće Povrće Hrana }


end
