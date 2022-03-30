class Message < ApplicationRecord
  belongs_to :chati
  after_create_commit { MessageBroadcastJob.perform_later self}
  
  def as_json(options={})
    super(options.merge({except: [:id, :chati_id]}))
end
end
