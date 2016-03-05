class WelcomeController < ApplicationController
    
    def index
        @mcc_officers = Officer.where(undergrad: true).order(created_at: :asc)
        @mice_officers = Officer.where(undergrad: false).order(created_at: :asc)
    end

    def events
    end
    def authors
    end
    def media
    end
end