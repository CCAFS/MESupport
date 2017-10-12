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
      'role': $('.rolesBlock li.current').classParam('id'),
      'stage': $('.stagesBlock li.current').classParam('id'),
      'category': $('.categoriesBlock li.current').classParam('id')
    }
    // Find recomended
    console.log(options);

    $.ajax({
       url: './api/guidelinesLevels/'+options.role+'/'+options.stage+'/'+options.category,
       beforeSend: function(){
       },
       success: function(data) {
         console.log(data);
       },
       complete: function(data) {
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
