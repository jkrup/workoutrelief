// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function(){
  $("a#flip").click( function(e) {
    $("div.front").toggle();
    $("div.back").toggle();
    return false;
  });
  // Bind the event.
  $("area").click(the_binding);


  function the_binding(e){
    switch($(this).attr('href'))
    {
      case "#head":
        //$.getJSON('parttoid/',{bodypart: ""}, respond_to_json);
        case "#neck":
        $.getJSON('parttoid/',{bodypart: "neck"}, respond_to_json);
      break;
      case "#chest":
        case "#shoulders":
        $.getJSON('parttoid/',{bodypart: "shoulders"}, respond_to_json);
      break;
      case "#stomach":
        $.getJSON('parttoid/',{bodypart: "stomach"}, respond_to_json);
      break;
      case "#biceps":
        case "#forearmwrists":
        case "#hands":
        $.getJSON('parttoid/',{bodypart: "arms"}, respond_to_json);
      break;
      case "#ankles":
        case "#feet":
        $.getJSON('parttoid/',{bodypart: "ankles"}, respond_to_json);
      break;
      case "#knees":
        $.getJSON('parttoid/',{bodypart: "knees"}, respond_to_json);
      break;
      case "#quads":
        $.getJSON('parttoid/',{bodypart: "quadriceps"}, respond_to_json);
      break;
      case "#shins":
        $.getJSON('parttoid/',{bodypart: "shins"}, respond_to_json);
      break;
      case "#calves":
        $.getJSON('parttoid/',{bodypart: "calves"}, respond_to_json);
      break;
      case "#rear":
      case "#hips":
        $.getJSON('parttoid/',{bodypart: "hips"}, respond_to_json);
      break;
      case "#hams":
        $.getJSON('parttoid/',{bodypart: "hamstring"}, respond_to_json);
      break;
      case "#spine":
        $.getJSON('parttoid/',{bodypart: "spine"}, respond_to_json);
      break;
      case "#back":
        $.getJSON('parttoid/',{bodypart: "back"}, respond_to_json);
      break;


    }
    //if ($(this).attr('href') == "#neck") {
    //$.getJSON('parttoid/',{bodypart: "Neck"}, respond_to_json);
    //}
    return false;
  }

  function respond_to_json(data)
  {
    console.log(data);
    window.location = "/bodypart?bodypart_id="+data
  }

});

