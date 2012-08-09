///////////////////////////////////////////////////////\\
///////////////////////////////////////////////////////\\
//***************************************************\\\\
//              JQuery Easy Tooltip v2.0             \\\\
//                    ExpBuilder                     \\\\
//                elkadrey@gmail.com                 \\\\
//                webmaster@expbuilder.com           \\\\
//***************************************************\\\\
///////////////////////////////////////////////////////\\
///////////////////////////////////////////////////////\\
jQuery.fn.nw_easytooltip = function(id, options)
{

    var Config = {
         backgroundcolor: "#ffffff",
         border         : "0px solid #000",
         color          : "#000",
         layerselector  : "body",
         event          : "mousemove",
         closeevent          : 'mouseout',
         position       : 'mouse',
         position_left       : '0px',
         position_top       : '0px'
    };

    if(options)
    {
		jQuery.extend(Config, options);
	};

    if(!document.getElementById('tool_tip'))
    {
       $(Config.layerselector).append('<div class="nw_tooltip_container" id="tool_tip_action_' + id + '">&nbsp;</div>');
       $("#tool_tip_action_" + id).css({"background-color": Config.backgroundcolor, border: Config.border, color: Config.color, position: "absolute", "z-index": "1004", "display": "none"});
    }

    function brwstester()
    {
        return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body;
    }

if(   $("#" + id)){
    $("#" + id).hide();

        $(this).bind(Config.event, function(e)
        {
        //alert(id);
        if(Config.event=="click")
        {
            $("#zorgatlas_messagebox").hide();
            $("#zorgatlas_label").hide();
          }  
            tooltiparr=$(".nw_tooltip_container");
            
            for(var i=0 ; i<tooltiparr.length; i++ ) 
            {
                if(tooltiparr[i].id!="tool_tip_action_" + id)
                {
                    $(tooltiparr[i]).hide();
                }
            }
          
            if(screen.width <= (e.pageX + 40 + $("#tool_tip_action_" + id).width()))
            {
               var lfts = e.pageX - $("#tool_tip_action_" + id).width() - 20;
            }

            else
            {
                  var lfts = e.pageX + 20;
            }

            if(brwstester().scrollTop < e.pageY - 20 - $("#tool_tip_action_" + id).height())
            {
                var tps =  (e.pageY - $("#tool_tip_action_" + id).height() - 20);
            }
            else
            {
                var tps = e.pageY + 20;
            }

            if (Config.position=="absolute")
            {
                   $("#tool_tip_action_" + id).html($("#" + id).html()).css({"left": Config.position_left, "top" : Config.position_top}).show();
            }
            else
            {
                $("#tool_tip_action_" + id).html($("#" + id).html()).css({"left": lfts, "top" : tps}).show();
            }
        });
if(Config.closeevent=="leave"){
    $("#tool_tip_action_" + id).click( function() {
 
       $("#tool_tip_action_" + id).hide().css({"left": 0, "top" : 0});
});
}
else
{
if(Config.closeevent=="delay")
{
       $(this).bind("mouseout", function()
       {
               
            setTimeout("$(\"#tool_tip_action_"  + id + "\").hide(\"slow\").css({\"left\": 0, \"top\" : 0});",4000);
       });
}
else
{
       $(this).bind(Config.closeevent, function()
       {
            $("#tool_tip_action_" + id).hide().css({"left": 0, "top" : 0});
       });
       }
}}

}
