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
jQuery.fn.easytooltip = function(id, options)
{

    var Config = {
         backgroundcolor: "#ffffff",
         border         : "1px solid #000",
         color          : "#000",
         layerselector          : "body",
         event          : 'mousemove'
    };

    if(options)
    {
		jQuery.extend(Config, options);
	};

    if(!document.getElementById('tool_tip'))
    {
              $(Config.layerselector).append('<div id="tool_tip_action_' + id + '">&nbsp;</div>');
       $("#tool_tip_action_" + id).css({"background-color": Config.backgroundcolor, border: Config.border, color: Config.color, position: "absolute", "z-index": "1004", "display": "none"});
    }

    function brwstester()
    {
        return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body;
    }


    $("#" + id).hide();

        $(this).bind(Config.event, function(e)
        {
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
            $("#tool_tip_action_" + id).html($("#" + id).html()).css({"left": lfts, "top" : tps}).show();
            //setTimeout("$(\"#tool_tip_action_" + id + "\").show()",1000);
        });


       $(this).bind("mouseout", function()
       {
            $("#tool_tip_action_" + id).hide().css({"left": 0, "top" : 0});
       });


}