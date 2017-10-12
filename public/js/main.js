$(document).ready(function() {

  //Attach Events
  attachEvents();
});

/********************************** Events *********************************/

function attachEvents(){
  // Select an option Event
  $('.selectionComponent ul li').on('click', selectAnOption );
}


/********************************** Functions *********************************/

function selectAnOption(){
  var $option = $(this);
  var optionText = $option.text();
  if (optionText.length > 28){
    optionText = optionText.slice(0,28) + '...';
  }
  var $parent = $option.parent();
  $parent.hide();
  // Set current option
  $option.addClass('current').siblings().removeClass('current');
  // Select an option
  $parent.parent().find('.optionText').html(optionText).parent().addClass('selected');

  if($('.selectionComponent li.current').length == 3){
    var optionsData = {
      'role': $('.rolesBlock li.current').classParam('id'),
      'stage': $('.stagesBlock li.current').classParam('id'),
      'category': $('.categoriesBlock li.current').classParam('id')
    }
    // Find recomended
    console.log(optionsData);
  }
}

/************************************ Utils ***********************************/

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

jQuery.fn.classParam = function(cssName) {
  return getClassParameter(this, cssName)
};
