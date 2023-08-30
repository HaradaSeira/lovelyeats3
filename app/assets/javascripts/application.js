// app/assets/javascripts/application.js

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require flatpickr
//= require_tree .

document.addEventListener("DOMContentLoaded", function () {
  flatpickr(".datepicker", {
    dateFormat: "Y-m-d", // 日付のフォーマットを指定
    // その他のオプションをここに追加できます
  });
});
