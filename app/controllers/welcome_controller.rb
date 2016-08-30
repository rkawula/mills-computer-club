class WelcomeController < ApplicationController
  def index
    @mcc_officers = Officer.order('created_at asc').where(undergrad: true)
    @mice_officers = Officer.order('created_at asc').where(undergrad: false)
  end

  def calendar
    # Do no extra work.
    # At the end of this method,
    # render the matching view.
  end

  def authors
  end

  def media
  end
end
