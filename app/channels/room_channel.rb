class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], chati_id: data['chati_id']
    chati = Chati.find(data['chati_id'])
    messages_count = chati.messages_count
    chati.update(messages_count: messages_count+1)
  end
end
