$(document).ready ->
  $('#calendar').fullCalendar({
  	googleCalendarApiKey: ENV['GCALENDAR_ID'],
  	events: {
  		googleCalendarId: ENV['GCALENDAR_KEY']
  	}
  });
  