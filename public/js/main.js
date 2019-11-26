var filterType, filesToZip = [], ls = localStorage;

// If this document is in a subdomain of ccafs.cgiar.org change
// the value
console.log(document.domain);
if (document.domain.indexOf("ccafs.cgiar.org") != -1) {
  document.domain = 'ccafs.cgiar.org';
}
if (document.domain.indexOf("ciat.cgiar.org") != -1) {
  document.domain = 'ciat.cgiar.org';
}
//

$(document).ready(function () {
  //Attach Events
  attachEvents();
  updateDataHeight();
});

/*********************************** Events ***********************************/

function attachEvents() {
  // Select an option Event
  $('.selectionComponent ul li').on('click', selectAnOption);

  // Download Documents
  $("a.download.1").on('click', function () {
    filterType = $(this).attr("id");
    if (getCheckedGuidelines().length > 0) {
      $("#step3").show().show().siblings().hide();
      $("#step1").hide();
    } else {
      $("#step1 .error").show();
    }
  });

  // Step 4 (Terms and conditions) form contact
  $("a.download.2").on('click', function () {
    var email = $("input[name=mail]").val();
    ls.setItem('email', email);
    if (validateEmail(email)) {
      loadUser(email);
      $("#step4").show().siblings().hide();
      updateDataHeight();
      $("#step3-form .error").hide();
    } else {
      $("#step3-form .error").show();
    }
  });

  // Step 5 (Links for download)
  $("a.download.3").on('click', function () {
    var verifiedText = verifyFields();
    if (verifiedText.length) {
      $("#step4-form .error").html('Please fill out the information in the following fields :<br>' + verifiedText);
      $("#step4-form .error").show();
    } else {
      $("#step5").show().siblings().hide();
      $("#step4-form .error").hide();
      printGuidelinesToDownload();
    }
  });

  // Donwload zip file - step5
  $("a.zipfileDownload").on('click', function () {
    var fileName = $(this).attr('href').split('/');
    fileName = fileName[fileName.length - 1];
    setTimeout(function () {
      deleteZipFile(fileName);
    }, 3000);
  });

  // New search - step5 to step1
  $("a.newSearch").on('click', function () {
    $("#step1").show().siblings().hide();
  });

  // Skip form
  $("a.skip.2").on('click', function () {
    var verifiedText = verifyFields();
    // Set Anonymous User
    $("#user-id").val("1");
    $("#step5").show().siblings().hide();
    printGuidelinesToDownload();
  });


}


/********************************** Functions *********************************/

function verifyFields() {
  var verified = '';
  // Validate first name.
  if ($("#first_name").is(":visible") && $("#first_name").val() == "") {
    verified += '* First name <br>';
  }
  // Validate last name.
  if ($("#last_name").is(":visible") && $("#last_name").val() == "") {
    verified += '* Last name <br>';
  }
  // Validate institute name.
  if ($("#institute-name").val() == "") {
    verified += '* Institute name <br>';
  }
  // Validate institute locations.
  if ($("input[name^='institute-regions']:checked").length == 0) {
    verified += '* Region(s) where your institute is located <br>';
    $(".institute-regions .group-label").css("color", "red");
  } else {
    $(".institute-regions .group-label").css("color", "");
  }
  // Validate research locations.
  if ($("input[name^='research-regions']:checked").length == 0) {
    verified += '* Region(s) of your research interes <br>';
    $(".research-regions .group-label").css("color", "red");
  } else {
    $(".research-regions .group-label").css("color", "");
  }
  // Validate intended use.
  if ($("#use").val() == "") {
    verified += '* Intended use of data <br>';
    $("#use").css("background-color", "#FF9999");
  } else {
    $("#use").css("background-color", "");
  }
  return verified;

}

function selectAnOption() {
  var $option = $(this);
  var optionText = $option.text();
  var type = $option.classParam('type');
  var $parent = $option.parent();
  $parent.hide();

  // Set current option
  $option.addClass('current').siblings().removeClass('current');
  $option.removeClass('notSelected').siblings().addClass('notSelected');
  // Select an option
  $parent.parent().find('.optionText').html(cutText(optionText, 28)).parent().addClass('selected');
  // Animate icon
  $parent.parent().find('img').animateCss('flipInX');

  var nOptions = $('.selectionComponent li.current').length;

  $('.check-' + type).addClass('checked');
  $('.nOptions').text(3 - nOptions);

  // Check that the 3 select options are selected
  if (nOptions == 3) {
    showResultsBlock('query');
    var options = {
      'r': $('.rolesBlock li.current').classParam('id'),
      's': $('.stagesBlock li.current').classParam('id'),
      'c': $('.categoriesBlock li.current').classParam('id')
    }


    $('#step1').show();
    $('#step3, #step4, #step5').hide();

    // Find recomended
    $.ajax({
      url: './api/guidelinesLevels/' + options.r + '/' + options.s + '/' + options.c,
      beforeSend: function () {
        $('.loading').fadeIn();
        // Clean data
        $('.results-query ul').empty();
        // Clear selected files to ZIP
        filesToZip = [];
      },
      success: function (data) {
        var guidelines = jQuery.parseJSON(data);
        // Update result message
        $('.results-query .nDocuments').text(guidelines.length);
        $('.results-query .roleText').text($('.rolesBlock li.current').text());
        $('.results-query .stageText').text($('.stagesBlock li.current').text());

        // Add category header
        $('.results-query ul').append('<li class="guidelineHead">' + $('.categoriesBlock li.current').text() + '</li>');

        //Add guidelines
        $.each(guidelines, function (i, guideline) {
          // Create guideline from template
          var $guideline = $('#guideline-template').clone(true).removeAttr('id');
          // Add guideline title
          $guideline.find('.title').text(guideline.code + ' ' + guideline.name);
          // Add importance level and the style
          $guideline.find('.level').text(guideline.importance_level);
          $guideline.find('.level').addClass(guideline.importance_level);
          // Add type as a class
          $guideline.addClass("type-" + guideline.type);
          // Update inputs:checkboxes
          $guideline.find('input:checkbox').attr('id', 'input-' + i);
          $guideline.find('input:checkbox').attr('data-idbd', JSON.stringify(guideline));
          $guideline.find('input:checkbox').attr('data-idbd.source', JSON.stringify(guideline.source));
          $guideline.find('label').attr('for', 'input-' + i);
          // Add the guideline to the list
          $('.results-query ul').append($guideline);
          $guideline.slideDown();
        });
      },
      complete: function (data) {
        $('.loading').fadeOut();
        updateDataHeight();
      }
    });
  }
}

function showResultsBlock(blockName) {
  $('.results-query .results-' + blockName).slideDown().siblings().slideUp();
}

function printGuidelinesToDownload() {
  var content = '';
  $("#step5 #guidelines ul").empty();

  getCheckedGuidelines().each(function (i, guideline) {
    var data = JSON.parse($(guideline).attr("data-idbd"));
    var className = 'guideline type-' + data.type + ' ';
    var downloadLink = '';
    var isExternal = ((data.source).indexOf("http") >= 0);
    if (isExternal) {
      className += 'external',
        downloadLink = data.source;
    } else {
      className += 'local',
        downloadLink = (data.source).replace(/ /g, "_");
    }
    content += "<li class='" + className + "'>";
    if (data.source) {
      content += "<a href='" + downloadLink + "' target='_blank'>";
    }
    content += " " + data.code + "  " + data.name + " ";
    if (data.source) {
      content += "</a>";
    }
    content += "</li>";
    if (!isExternal && data.source) {
      filesToZip.push(downloadLink);
    }
    console.log(data.source);
  });

  createZipFile();
  setDownload();
  $("#step5 #guidelines ul").html(content);
  updateDataHeight();
}


function showResultsBlock(blockName) {
  $('.resultsBlock .results-' + blockName).slideDown().siblings().slideUp();
}

function setDownload() {
  var $researchRegions = $('input[name="research-regions"]:checked');
  var $institudeRegions = $('input[name="institute-regions"]:checked');
  var researchRegions = [];
  var instituteRegions = [];
  var guideSelected = [];
  // Google Analytics custom events
  getCheckedGuidelines().each(function (i, e) {
    var data = JSON.parse($(e).attr("data-idbd"));
    guideSelected.push(data.id);
    setCustomEvent('Guidelines', 'downloaded', data.name);
  });
  $researchRegions.each(function (i, e) {
    researchRegions.push(e.value);
    setCustomEvent('Region_of_Research', 'download', $(e).next().text());
  });
  $institudeRegions.each(function (i, e) {
    instituteRegions.push(e.value);
    setCustomEvent('Region_Institute_located', 'download', $(e).next().text());
  });
  setCustomEvent('Users', 'download', $("#mail").val());
  setCustomEvent('Institute', 'download', $("#institute-name").val());

  $.ajax({
    type: "POST",
    url: "./api/setDownload",
    data: {
      userId: $("#user-id").val(),
      email: $("#mail").val(),
      firstName: $("#first_name").val(),
      lastName: $("#last_name").val(),
      instituteName: $("#institute-name").val(),
      use: $("#use").val(),
      guideSelected: guideSelected,
      researchRegions: researchRegions,
      instituteRegions: instituteRegions
    },
    beforeSend: function () {
      $('.loading').fadeIn();
    },
    success: function (result) { },
    complete: function (data) {
      $('.loading').fadeOut(function () {
        updateDataHeight();
      });
    },
  });
}

function loadUser(email) {
  $.ajax({
    type: "GET",
    dataType: "json",
    url: "./api/getPersonInfo/" + email,
    data: {},
    beforeSend: function () {
      $('.loading').fadeIn();
      $("#user-id").val("");
    },
    success: function (person) {
      $("#user-id").val(person.id);
      $("#first_name").val(person.first_name);
      $("#first_name").attr("disabled", (person.first_name ? true : false));
      $("#last_name").val(person.last_name);
      $("#last_name").attr("disabled", (person.last_name ? true : false));
      $("#institute-name").val(person.institute);
      $("#institute-name").attr("disabled", (person.institute ? true : false));
    },
    complete: function (data) {
      $('.loading').fadeOut(function () {
        updateDataHeight();
      });
    }
  });
}

function createZipFile() {
  if (filesToZip.length > 1) {
    $.ajax({
      type: "POST",
      url: "./api/zipfile",
      data: {
        files: filesToZip,
        overwrite: "true"
      },
      success: function (data) {
        $('a.zipfileDownload').show().attr('href', "./" + data).find('.nfiles').text(filesToZip.length);
      }
    });
  } else {
    $('a.zipfileDownload').hide();
  }
}

function deleteZipFile(fileName) {
  $.ajax({
    type: "GET",
    url: "./api/zipfile/deleteFile",
    data: {
      file: fileName
    },
    success: function (data) {
      $('a.zipfileDownload').hide(200);
    }
  });
}

/*********************************** Utils ************************************/

function setCustomEvent(eventName, event_category, event_label) {
  gtag('event', eventName, {
    'event_category': event_category,
    'event_label': event_label
  });
}

function getClassParameter(selector, cssName) {
  var check = cssName + "-";
  var className = $(selector).attr('class') || '';
  var type = $.map(className.split(' '), function (val, i) {
    if (val.indexOf(check) > -1) {
      return val.slice(check.length, val.length);
    }
  });
  return ((type.join(' ')) || 'none');
}

function cutText(str, l) {
  if (str.length > l) {
    str = str.slice(0, l) + '...';
  }
  return str;
}

jQuery.fn.classParam = function (cssName) {
  return getClassParameter(this, cssName)
};

function getCheckedGuidelines() {
  return $('.results-query input[name="check-guidelines"]:checked');
}

function validateEmail(emailField) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  if (emailField == "" || !emailReg.test(emailField)) {
    return false;
  } else {
    return true;
  }
}

function getWindowHeight() {
  return $("#block-system-main").height();
}

function updateDataHeight() {
  // Update the attribute data-height in the body tag
  $("body").attr("data-height", getWindowHeight());
}

jQuery.fn.classParam = function (cssName) {
  return getClassParameter(this, cssName)
};

$.fn.extend({
  animateCss: function (animationName) {
    var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    this.addClass('animated ' + animationName).one(animationEnd, function () {
      $(this).removeClass('animated ' + animationName);
    });
    return this;
  }
});
