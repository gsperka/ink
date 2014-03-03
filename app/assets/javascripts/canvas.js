var Canvas = function(el) {
  this.el = el

  this.createCanvas($("#parent-sketch-data").val());
  this.showTools();
}

Canvas.prototype.createCanvas = function(parentSketch) {
  this.fabcanvas = new fabric.Canvas('canvas-partial-box', {isDrawingMode: true});
  this.fabcanvas.loadFromJSON(parentSketch, this.fabcanvas.renderAll.bind(this.fabcanvas));
  this.fabcanvas.freeDrawingBrush.width = 5;
}

Canvas.prototype.showTools = function() {
  this.clearButton();
}

Canvas.prototype.clearButton = function() {
  console.log($(this.el).find('#clear-canvas'))
  $(this.el).find('#clear-canvas').on('click', function(event) {
    document.location.reload();
  })
}

$(document).ready(function(){
  var canvas = new Canvas('#format-canvas-elements')
});


//   var brush = fabcanvas.freeDrawingBrush.width = 5;
//   $("#super-tiny-brush").mousedown(function(e){
//     fabcanvas.freeDrawingBrush.width = 2;
//   });
//   $("#tiny-brush").mousedown(function(e){
//     fabcanvas.freeDrawingBrush.width = 5;
//   });
//   $("#small-brush").mousedown(function(e){
//     fabcanvas.freeDrawingBrush.width = 15;
//   });
//   $("#medium-brush").mousedown(function(){
//     fabcanvas.freeDrawingBrush.width = 25;
//   });
//   $("#large-brush").mousedown(function(){
//     fabcanvas.freeDrawingBrush.width = 35
//   });
//   $("#red").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#E31623"
//   });
//   $("#yellow").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#E3E316"
//   });
//   $("#green").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#16E341"
//   });
//   $("#blue").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#165EE3"
//   });
//   $("#black").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "black"
//   });
//   $("#white").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "white"
//   });
//   $("#gray").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#838895"
//   });
//   $("#purple").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#7816E3"
//   });
//   $("#orange").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#E36B16"
//   });
//   $("#brown").mousedown(function(){
//     fabcanvas.freeDrawingBrush.color = "#5F3D25"
//   });




//   $('#sketch-submit').on("click", function(){
//     var sketchInfo = JSON.stringify(fabcanvas);
//     if (typeof parentSketch === 'undefined') {
//       var tree = {sketch_json: sketchInfo};
//       $.ajax({
//         method: "POST",
//         url: "/trees",
//         data: tree,
//         dataType: 'json',
//         success: function(response){
//           window.location.replace('/trees/' + response)
//         }
//       });
//     }

//     else {
//       if(parentSketch === sketchInfo) alert('Cannot submit without any contribution');
//       else {
//         var tree = {sketch_json: sketchInfo, parent_id: parent_id};
//         $.ajax({
//           method: "POST",
//           url: "/trees/" + tree_id + "/sketches",
//           data: tree,
//           success: function(response){
//             window.location.replace('/trees/' + tree_id)
//           }
//         });
//       };
//     }
//   });
//   if(typeof(pixelCount) === 'function') pixelCount();
// 
