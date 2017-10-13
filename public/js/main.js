$(document).ready(function() {

  //Attach Events
  attachEvents();
});

/*********************************** Events ***********************************/

function attachEvents(){
  // Select an option Event
  $('.selectionComponent ul li').on('click', selectAnOption );
}

/********************************** Functions *********************************/

function selectAnOption(){
  var $option = $(this);
  var optionText = $option.text();
  var type = $option.classParam('type');
  var $parent = $option.parent();
  $parent.hide();
  // Set current option
  $option.addClass('current').siblings().removeClass('current');
  // Select an option
  $parent.parent().find('.optionText').html(cutText(optionText, 28)).parent().addClass('selected');
  // Animate icon
  $parent.parent().find('img').animateCss('flipInX');

  var nOptions = $('.selectionComponent li.current').length;

  $('.check-'+type).addClass('checked');
  $('.nOptions').text(3 - nOptions);

  // Check that the 3 select options are selected
  if(nOptions == 3){
    showResultsBlock('query');
    var options = {
      'r': $('.rolesBlock li.current').classParam('id'),
      's': $('.stagesBlock li.current').classParam('id'),
      'c': $('.categoriesBlock li.current').classParam('id')
    }
    // Find recomended
    $.ajax({
       url: './api/guidelinesLevels/'+options.r+'/'+options.s+'/'+options.c,
       beforeSend: function(){
         $('.loading').fadeIn();
         // Clean data
         $('.results-query ul').empty();
       },
       success: function(data) {
         var guidelines = jQuery.parseJSON( data);
         // Update result message
         $('.results-query .nDocuments').text(guidelines.length);
         $('.results-query .roleText').text($('.rolesBlock li.current').text());
         $('.results-query .stageText').text($('.stagesBlock li.current').text());

         // Add category header
         $('.results-query ul').append('<li class="guidelineHead">'+$('.categoriesBlock li.current').text()+'</li>');

         //Add guidelines
         $.each(guidelines, function(i, guideline){
           // Create guideline from template
           var $guideline = $('#guideline-template').clone(true).removeAttr('id');
           // Add guideline title
           $guideline.find('.title').text(guideline.code+' '+guideline.name);
           // Add importance level and the style
           $guideline.find('.level').text(guideline.importance_level);
           $guideline.find('.level').addClass(guideline.importance_level);
           // Update inputs:checkboxes
           $guideline.find('input:checkbox').attr('id', 'input-'+i);
           $guideline.find('label').attr('for', 'input-'+i);
           // Add the guideline to the list
           $('.results-query ul').append($guideline);
           $guideline.slideDown();
         });
       },
       complete: function(data) {
         $('.loading').fadeOut();
       }
    });
  }
}

function showResultsBlock(blockName){
  $('.resultsBlock .results-'+blockName).slideDown().siblings().slideUp();
}

/*********************************** Utils ************************************/

function getClassParameter(selector,cssName) {
  var check = cssName + "-";
  var className = $(selector).attr('class') || '';
  var type = $.map(className.split(' '), function(val,i) {
    if(val.indexOf(check) > -1) {
      return val.slice(check.length, val.length);
    }
  });
  return((type.join(' ')) || 'none');
}

function cutText(str, l){
  if (str.length > l){
    str = str.slice(0,l) + '...';
  }
  return str;
}

jQuery.fn.classParam = function(cssName) {
  return getClassParameter(this, cssName)
};

$.fn.extend({
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
        });
        return this;
    }
});
