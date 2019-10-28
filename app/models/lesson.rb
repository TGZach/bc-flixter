class Lesson < ApplicationRecord
  belongs_to :section
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, with_same: :section_id

  def next_section
    section = course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
    return section
  end

end
