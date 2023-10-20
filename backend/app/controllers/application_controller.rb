class ApplicationController < ActionController::API
  def load_data(file_path)
    full_path = Rails.root.join(file_path)
    file = File.read(full_path)
    JSON.parse(file)
  end
end
