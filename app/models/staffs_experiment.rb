class StaffsExperiment < ActiveRecord::Base

  validates_presence_of :experiment_id, :staff_id, :starred, :assigned

  belongs_to :experiment
  belongs_to :staff, class_name: "User"

end
