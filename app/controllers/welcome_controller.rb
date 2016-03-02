class WelcomeController < ApplicationController
    
    def index
        @mcc_officers = Officer.where undergrad: true
        @mice_officers = Officer.where undergrad: false
    end

    def blog
    end
    def events
    end
    def authors
    end
    def media
    end
end