// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require users

$(document).on('turbolinks:load', function(){

  // flash messages disappear after 2 seconds.
   setTimeout(function(){
     $('#flash').fadeOut(1000);
   }, 1000);

   // called on file upload, client-side
   // source: http://stevenyue.com/blogs/validate-attachment-file-size-and-type-in-rails/
   function validateFiles(inputFile) {
    var maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB)";
    var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
    var allowedExtension = ["jpg", "jpeg", "gif", "png"];

    var extName;
    var maxFileSize = $(inputFile).data('max-file-size');
    var sizeExceeded = false;
    var extError = false;

    $.each(inputFile.files, function() {		
 -     if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};		
 -      extName = this.name.split('.').pop();		
 -     if ($.inArray(extName, allowedExtension) == -1) {extError=true;};		
 -   });		
 -   if (sizeExceeded) {		
 -     window.alert(maxExceededMessage);		
 -     $(inputFile).val('');		
 -   };		
 -		
 -   if (extError) {		
 -     window.alert(extErrorMessage);		
 -     $(inputFile).val('');		
 -   };		
 - }
});
