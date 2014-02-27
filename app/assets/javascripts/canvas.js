var fabcanvas

$(document).ready(function(){
  fabcanvas = new fabric.Canvas('canvas', {isDrawingMode: true});
  
  $(document).on("click", "#sketch-submit", function(){
    var sketchInfo = JSON.stringify(fabcanvas);
    console.log("sketch submit button clicked");
    console.log(sketchInfo);
    var tree = {sketch_json: sketchInfo}
    $.ajax({
            method: "POST",
            url: "/trees",
            data: tree,
            success: function(){
              console.log("Great success!");
            }
    });
  });
});