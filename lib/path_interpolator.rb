class PathInterpolator
  def self.path(params)
    return "/appeals/#{params['section_id']}/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}/#{Time.now.hour}_#{Time.now.min}_#{UUID.generate.split('-').first}/#{params[:class_name]}"
  end
end
