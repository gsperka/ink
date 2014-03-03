var Canvas = function(el) {
  this.el = el;
  this.parentSketch = $('#parent-sketch-data').val();
  this.createCanvas(this.parentSketch);
  this.showTools();
  this.submitSketch();
};

Canvas.prototype.createCanvas = function(parentSketch) {
  this.fabcanvas = new fabric.Canvas('canvas-partial-box', {isDrawingMode: true});
  this.fabcanvas.loadFromJSON(parentSketch, this.fabcanvas.renderAll.bind(this.fabcanvas));
  this.fabcanvas.freeDrawingBrush.width = 5;
};

Canvas.prototype.showTools = function() {
  this.clearButton();
  this.brushTools();
  this.colorTools();
};

Canvas.prototype.clearButton = function() {
  $(this.el).find('#clear-canvas').on('click', function(event) {
    document.location.reload();
  });
};

Canvas.prototype.brushTools = function() {
  this.brush('#super-tiny-brush', 2);
  this.brush('#tiny-brush', 5);
  this.brush('#small-brush', 15);
  this.brush('#medium-brush', 25);
  this.brush('#large-brush', 35);
};

Canvas.prototype.brush = function(el, width) {
  var self = this;
  $(el).mousedown(function() {
    self.fabcanvas.freeDrawingBrush.width = width;
  });
};

Canvas.prototype.colorTools = function() {
  this.color('#red', '#E31623');
  this.color('#orange', '#E36B16');
  this.color('#yellow', '#E3E316');
  this.color('#green', '#16E341');
  this.color('#blue', '#165EE3');
  this.color('#purple', '#7816E3');
  this.color('#brown', '#5F3D25');
  this.color('#black', '#black');
  this.color('#gray', '#838895');
  this.color('#white', 'white');
};

Canvas.prototype.color = function(el, color) {
  var self = this;
  $(el).mousedown(function() {
    self.fabcanvas.freeDrawingBrush.color = color;
  });
};

Canvas.prototype.submitSketch = function() {
  self = this;
  $(this.el).find('#sketch-submit').on("click", function(){
    var sketchInfo = JSON.stringify(self.fabcanvas);
    self.newTreeOldTree(sketchInfo);
  });
}

Canvas.prototype.newTreeOldTree = function(sketchInfo) {
  if (typeof self.parentSketch === 'undefined') {
    self.postNewTree(sketchInfo);
  }
  else {
    self.calaborateCheck(sketchInfo);
  }  
}

Canvas.prototype.calaborateCheck = function(sketchInfo) {  
  if(self.parentSketch === sketchInfo) alert('Cannot submit without any contribution');
  else {
    self.postNewSketch(sketchInfo);
  };
}

Canvas.prototype.postNewTree = function(sketchInfo) {
  $.ajax({
    method: "POST",
    url: "/trees",
    data: {sketch_json: sketchInfo},
    dataType: 'json',
    success: function(response){
      window.location.replace('/trees/' + response)
    }
  });
}

Canvas.prototype.postNewSketch = function(sketchInfo) {
  $.ajax({
    method: "POST",
    url: "/trees/" + tree_id + "/sketches",
    data: {sketch_json: sketchInfo, parent_id: parent_id},
    success: function(response){
      window.location.replace('/trees/' + tree_id)
    }
  });
}

//   if(typeof(pixelCount) === 'function') pixelCount();

$(document).ready(function(){
  var canvas = new Canvas('#format-canvas-elements');
});




