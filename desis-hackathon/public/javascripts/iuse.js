var mouse_clicked = false;
var mouse_inside = false;
var socket = io.connect('/');

socket.on('iuse:init', function (cloudJson) {
  $("#iuse_list").html("");
  render(cloudJson);
});

socket.on('iuse:update', function (cloudJson) {
  render(cloudJson, true);
});

socket.on('view:load', function(url) {
  if ($("#user_name").html() == "projector")
    window.location = url;
});

function JT_show(message,linkId,title,width,scale){
	$("div.callout").remove();
    if(title == false)title="&nbsp;";
    var de = document.documentElement;
    var w = self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
    var hasArea = w - getLeftXY(linkId);
    var clickElementy = getTopXY(linkId) + (scale * 16) + 2; //set y position
    var params = new Object ();
    if (width == null) {
    	params['width'] = 240;	
    }
    else {
    	params['width'] = width;
    }
    
    if(hasArea>((params['width']*1))){
        $("#iuse_list").parent().append("<div id='JT_" + linkId + 
                          "' class='callout border-callout' style='width:" +
                          params['width']*1+"px'><div id='JT_close_left_"  +
                          linkId +"' class='callout-title'>" +
                          title +"</div><div id='JT_copy_" + linkId + 
                          "'  class='callout-body'></div><b class='border-notch notch notch-left'></b><b class='notch notch-left'></b></div>");
        var arrowOffset = getElementWidth(linkId) + 11;
        var clickElementx = getLeftXY(linkId) + ((scale-1) * 8) - 15; //set x position
    }else{
        $("#iuse_list").parent().append("<div id='JT_" + linkId + 
                          "' class='callout border-callout' style='width:" + 
                          params['width']*1+"px'><div id='JT_close_right_" + 
                          linkId +"' class='callout-title' style='padding:3px;border-bottom:1px solid #DDDDDD;'>" +
                          title +"</div><div id='JT_copy_" + linkId +
                          "'  class='callout-body'></div><b class='border-notch notch notch-right'></b><b class='notch notch-right'></b></div>");
        var clickElementx = getLeftXY(linkId) - ((params['width']*1) - 40); //set x position
    }
    $('#JT_' + linkId).css({left: clickElementx+"px", top: clickElementy+"px"});
    $('#JT_' + linkId).show("slow");
	$('#JT_' + linkId).mouseenter(function(e){mouse_inside=true;console.log(mouse_inside);}).mouseleave(function(e){mouse_inside=false;console.log(mouse_inside);});
    $('#JT_copy_' + linkId).html(message);
    /*$('#JT_' + linkId).click(function() {
        $(this).fadeOut('slow',function() {
            $(this).remove();
        });
    });*/
}

function getElementWidth(objectId) {
    x = document.getElementById(objectId);
    return x.offsetWidth;
}

function getLeftXY(objectId) {
    // Get an object left position from the upper left viewport corner
    o = document.getElementById(objectId)
    oLeft = o.offsetLeft            // Get left position from the parent object
    while(o.offsetParent!=null) {   // Parse the parent hierarchy up to the document element
        oParent = o.offsetParent    // Get parent object reference
        oLeft += oParent.offsetLeft // Add parent left position
        o = oParent
    }
    return oLeft - $(".cell").offset().left;
}

function getTopXY(objectId) {
    // Get an object top position from the upper left viewport corner
    return $('#' + objectId).offset().top;
}

function parseQuery ( query ) {
   var Params = new Object ();
   if ( ! query ) return Params; // return empty object
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ ) {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
   }
   return Params;
}

function blockEvents(evt) {
              if(evt.target){
              evt.preventDefault();
              }else{
              evt.returnValue = false;
              }
}


$(document).ready(function(){

	$(document).click
	(
	  function(e)
	  {
	  console.log(mouse_inside);
		 if(!mouse_inside)
		{
		  $('.callout').fadeOut('slow',function() {
			   $('.callout').remove();
		   });
		}
	  }
	);

  $("#iuse_list").html("<img src='/images/loading.gif'/>");
});

function render(cloudJson, update) {  
    //var jsonStr = '[{"tech":"mac","usedBy":"suse2,hackers1,admin,team1,team7,team4,team9"},{"tech":"Windows","usedBy":"steam43,team91,use2,hackers1,ninjacders"},{"tech":"java","usedBy":"suse2,hackers1,ninjacoders,team1,team7,team4,team9,team123,team43,team91,team93,team44,team19"},{"tech":"Android","usedBy":"suse2,hackers1,ninjacoders"},{"tech":"jQuery","usedBy":"suse2,team123,team43,team91,team93,hackers1,ninjacoders"},{"tech":"Perl","usedBy":"suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,suse2,hackers1,ninjacoder,ssuse2,hackers1,ninjacoders"},{"tech":"Python","usedBy":"suse2,hackers1,ninjacoders,team1,team7,team4,team9"},{"tech":"Struts","usedBy":"team9,hujk1,suse2,hackers1,ninjacoders"},{"tech":"Eclipse","usedBy":"suse2,hackers1,ninjacoders,team1,team7,team4,team9"}]';
    //var cloudJson = jQuery.parseJSON(jsonStr);
    var currentUser = $("#user_name").html();
    jQuery.each(cloudJson, function() {
      var usedBy = removeDuplicates(this.usedBy);
      var tech = this.tech;
      var flag = (usedBy.indexOf(currentUser) != -1);
      var scale = Math.ceil((usedBy.length > 15 ? 15 : usedBy.length) / 3);
      if (!update)
        $('#iuse_list').append('<div id="iuse_'+this.tech+'" class="cloud9" style="opacity:' + (flag ? 1 : 0.3) + ';float:left"><img id="iuse_'+this.tech+'_img" src="/images/'+this.tech+'-'+(scale === 0 ? 1 : scale )+'.png" /></div>');
      else {
        $('#iuse_' + this.tech).html('<img id="iuse_'+this.tech+'_img" src="/images/'+this.tech+'-'+(scale === 0 ? 1 : scale )+'.png" />').css("opacity", (flag ? 1 : 0.3));
        $('#iuse_' + this.tech).hide().fadeIn('slow');
      }
      
      $('#iuse_'+this.tech).off('mouseenter').off('mouseleave');
      $('#iuse_'+this.tech).on('mouseenter',function(event) {
      $(this).css('opacity',1);
      var a=this.id;
      
      setTimeout( function() {
        var popupHTML = '<ul class="callout-hackers">';
        for (var i=0; i<usedBy.length; i++) {
          popupHTML += '<li>'+usedBy[i]+'</li>';
        }
        popupHTML +='</ul><br/>';
        if (flag)
          popupHTML += '<b style="font-size:16px;font-style:normal;color:#fff;">You are also using!</b>';
        else
          popupHTML += '<b style="font-size:16px;font-style:normal;color:#fff;">Do you use?</b><a class="callout-plus" style="text-decoration:none;" href="#" onclick="toggleUse(\'' + tech + '\',' + flag + ');"> <img src="/images/plus1.png"/></a>';

        JT_show(popupHTML,a,'Teams using '+ a.replace("iuse_", "") +' ('+usedBy.length+')',200,scale);
      },500);
        
      }).on('mouseleave',function(event) {
        $(this).css('opacity',(flag ? 1 : 0.3));
        //$('.callout').remove();
      });

      $('#iuse_'+this.tech).off('click');
      $('#iuse_'+this.tech).on('click', function(event) {
        toggleUse(tech, flag);
      }); 
  });
}

function toggleUse(tech, flag) {
  var m = {tech: tech};
  if (flag)
    m.operation = "remove";
  else
    m.operation = "add";
  socket.emit('iuse:update', m);
  $('.callout').fadeOut('slow',function() {
    $('.callout').remove();
  });
}