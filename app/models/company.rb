class Company < ActiveRecord::Base
  has_attached_file :logo, :styles => { :thumb => "100x100>" }.merge(PAPERCLIP_STORAGE_OPTIONS)

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :presence => true

  # ----------------------------------------------------------------------
  # == State Machine == #
  # ----------------------------------------------------------------------

  state_machine :current_state, :initial => :pending do
    state :active
    state :pending
    state :inactive

    event :disable do
      transition :active => :inactive
    end

    event :enable do
      transition [:pending] => :active
    end
  end
end