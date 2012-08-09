//hack om bij statische publicatie het pad naar plaatjes goed te zetten
 $(document).ready(function(){
 var images=$("img");
 var scripts=$("script");
 var scriptpath=$(scripts[0]).attr("src");
 
 var relPath=scriptpath.substring(0,scriptpath.indexOf("/javascript"));
  if(location.href.toLowerCase().indexOf("netwritergui")==-1 & images.length>0)
 {
    
  
    for(var i=0 ; i<images.length; i++ ) 
    {
    
        if ($(images[i]).attr("src").indexOf("object_binary")!=-1)
        {
        
            newsrc=relPath+$(images[i]).attr("src");
            if(relPath=="" )
            {
               newsrc=relPath+$(images[i]).attr("src").substring(1);
            }
        $(images[i]).attr("src",newsrc);
        }
    }
    var links=$("a");
    for(var i=0 ; i<links.length; i++ ) 
    {
    
        if ($(links[i]).attr("href").indexOf("object_binary")!=-1)
        {
        
            newsrc=relPath+$(links[i]).attr("href");
            if(relPath=="" )
            {
               newsrc=relPath+$(links[i]).attr("href").substring(1);
            }
        $(links[i]).attr("href",newsrc);
        }
    }
 }
 });