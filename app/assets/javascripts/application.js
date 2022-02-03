// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require activestorage
//= require turbolinks
//= require_tree .


var loader = document.querySelector('#mydiv');

// setTimeout(function unwait() { loader.hidden = true; }, 1000);


// $(document).ready(function(){
// $('#mydiv').fakeLoader({
//     timeToHide:2200,
//    });
//   });


// window.onload = (function () {
//   console.log('first Test');
//   console.log(document.readyState);
//   setTimeout(function () {
//       $('#mydiv').hide();
//       console.log('Test');
//   }, 2000);
// });

document.addEventListener("DOMContentLoaded", function(){
  // console.log('TEST TEST DOCUMENT')
});

window.addEventListener("load", function(){
  setTimeout(function() {
  loader.style.display = "none";
    }, 2000)
});

