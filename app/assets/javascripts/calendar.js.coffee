$(document).ready ->

  $('#calendar').fullCalendar({
  	googleCalendarApiKey: gID,
  	events: {
  		googleCalendarId: gKey
  	}
  });
  