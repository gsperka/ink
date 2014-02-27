var fabcanvas
var newcanvas
$(document).ready(function(){
   newcanvas = new fabric.Canvas('canvas', {isDrawingMode: false});
   console.log(newcanvas)

  $('#recently_added').append(newcanvas.loadFromJSON(sketch, newcanvas.renderAll.bind(newcanvas)));










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




//fabcanvas.loadFromJSON(json, canvas.renderAll.bind(fabcanvas)); <-- loads image immediately into canvas
