var fabcanvas;
$(document).ready(function(){


  var parentSketch = $("#parent-sketch-data").val();

  fabcanvas = new fabric.Canvas('canvas-partial-box', {isDrawingMode: true});
  fabcanvas.loadFromJSON(parentSketch, fabcanvas.renderAll.bind(fabcanvas));
  $("#clear-canvas").click(function(){
    document.location.reload();
  });
  var brush = fabcanvas.freeDrawingBrush.width = 5;
  $("#super-tiny-brush").mousedown(function(e){
    fabcanvas.freeDrawingBrush.width = 2;
  });
  $("#tiny-brush").mousedown(function(e){
    fabcanvas.freeDrawingBrush.width = 5;
  });
  $("#small-brush").mousedown(function(e){
    fabcanvas.freeDrawingBrush.width = 15;
  });
  $("#medium-brush").mousedown(function(){
    fabcanvas.freeDrawingBrush.width = 25;
  });
  $("#large-brush").mousedown(function(){
    fabcanvas.freeDrawingBrush.width = 35
  });
  $("#red").mousedown(function(){
    fabcanvas.freeDrawingBrush.color = "red"
  });
  $("#yellow").mousedown(function(){
    fabcanvas.freeDrawingBrush.color = "yellow"
  });
  $("#green").mousedown(function(){
    fabcanvas.freeDrawingBrush.color = "green"
  });
  $("#blue").mousedown(function(){
    fabcanvas.freeDrawingBrush.color = "blue"
  });

  //   colorPicker = $('#picker').colpick({
  //   flat:true,
  //   layout:'hex',
  //   submit:0
  // });

  //   $("#picker").onChange(function(e){
  //   console.log(e.target.value);
  //   fabcanvas.freeDrawingBrush.color = e.target.value;
  // });




  $(document).on("click", "#sketch-submit", function(){
    var sketchInfo = JSON.stringify(fabcanvas);

    if (typeof parentSketch === 'undefined') {
      var tree = {sketch_json: sketchInfo};
      $.ajax({
        method: "POST",
        url: "/trees",
        data: tree,
        dataType: 'json',
        success: function(response){
          window.location.replace('/trees/' + response)
        }
      });
    }

    else {
      if(parentSketch === sketchInfo) alert('Cannot submit without any contribution');
      else {
        var tree = {sketch_json: sketchInfo, parent_id: parent_id};
        $.ajax({
          method: "POST",
          url: "/trees/" + tree_id + "/sketches",
          data: tree,
          success: function(response){
            window.location.replace('/trees/' + tree_id)
          }
        });
      };
    }
  });
});



//fabcanvas.loadFromJSON(json, canvas.renderAll.bind(fabcanvas)); <-- loads image immediately into canvas
 // $('#recently_added').append(newcanvas.loadFromJSON(sketch, newcanvas.renderAll.bind(newcanvas)));
