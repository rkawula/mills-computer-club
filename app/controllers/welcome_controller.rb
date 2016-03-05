class WelcomeController < ApplicationController
    
    def index
        @mcc_officers = Officer.order(created_at: :asc).where(undergrad: true)
        @mice_officers = Officer.order(created_at: :asc).where(undergrad: false)
    end

    def events
    end
    def authors
    end
    def media
    end
end