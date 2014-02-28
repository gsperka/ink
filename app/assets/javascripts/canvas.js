var fabcanvas;
$(document).ready(function(){


  var lastSketch = $("#last-sketch-data").val();

  fabcanvas = new fabric.Canvas('canvas-partial-box', {isDrawingMode: true});
  fabcanvas.loadFromJSON(lastSketch, fabcanvas.renderAll.bind(fabcanvas));

  $(document).on("click", "#sketch-submit", function(){
    var sketchInfo = JSON.stringify(fabcanvas);
    console.log("sketch submit button clicked");
    console.log(sketchInfo);
    var tree = {sketch_json: sketchInfo};
    console.log(typeof lastSketch === 'undefined');
    if (typeof lastSketch === 'undefined') {
      console.log("I am running the if part")
      $.ajax({
              method: "POST",
              url: "/trees",
              data: tree,
              success: function(){
                console.log("Great success!");
              }
      });
    } else {
            console.log("I am running the else part")
      $.ajax({
              method: "POST",
              url: "/trees/2/sketches",
              data: tree,
              success: function(response){
                console.log(response);
              },
              dataType: "json"
      });
    }

  });
});



//fabcanvas.loadFromJSON(json, canvas.renderAll.bind(fabcanvas)); <-- loads image immediately into canvas
 // $('#recently_added').append(newcanvas.loadFromJSON(sketch, newcanvas.renderAll.bind(newcanvas)));
