// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Your additional code here

function syncEndDateTime(startDateTime) {
  document.getElementById("end_time_1i").value = startDateTime.substring(0, 4);
  document.getElementById("end_time_2i").value = startDateTime.substring(5, 7);
  document.getElementById("end_time_3i").value = startDateTime.substring(8, 10);
}