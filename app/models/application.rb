class Application < ApplicationRecord
    has_many :chatis
    has_secure_token

    def as_json(options={})
        super(options.merge({except: :id}))
    end
end
