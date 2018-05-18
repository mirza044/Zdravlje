class Item < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
    has_many :line_items
    mount_uploader :image, ImageUploader
    serialize :image, JSON #if you use SQLite, add this line

    validates :title, :price, presence: true
    validates :description, length: { maximum: 1000, too_long: "dovoljeno je maksimalno %{count} karakterta. "}
    validates :title, length: { maximum: 140, too_long: "dovoljeno je maksimalno %{count} karakterta. "}
    validates :price, length: { maximum: 7 } #numericality: { only_integer: true },
    #validates :type, length: { maximum: 140, too_long: "dovoljeno je maksimalno %{count} karakterta. "}

    #TYPE = %w{ Sok Voće Povrće Hrana }


    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw :abort
        end
    end

end
