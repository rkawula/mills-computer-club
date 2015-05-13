$(document).ready ->

  var gID = <%= ENV['GCALENDAR_ID'] %>;
  var gKey = <%= ENV['GCALENDAR_KEY'] %>;

  $('#calendar').fullCalendar({
  	googleCalendarApiKey: gID,
  	events: {
  		googleCalendarId: gKey
  	}
  });
  