// app/assets/javascripts/application.js

//= require rails-ujs
//= require activestorage
//= require flatpickr
//= require_tree .

import { Turbo } from "@hotwired/turbo-rails"

document.addEventListener("DOMContentLoaded", function () {
  flatpickr(".datepicker", {
    dateFormat: "Y-m-d", // 日付のフォーマットを指定
    // その他のオプションをここに追加できます
  });
});
