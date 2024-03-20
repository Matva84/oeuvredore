class Document < ApplicationRecord
  AUTHORIZED_CATEGORIES = ["Photo", "Facture", "Devis", "Contrat", "Autre"]
  acts_as_taggable_on :tags
  belongs_to :project

  validates :name, presence: true
  validates :url, presence: true
  #validates :type_of_document#, presence: true, inclusion: { in: AUTHORIZED_CATEGORIES }
end
