import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["myCanvas"]
    connect() {
      let canvas = this.myCanvasTarget;
      let ctx = canvas.getContext("2d");
      let painting = false;

      canvas.addEventListener("mousedown", startPosition);
      canvas.addEventListener("mouseup", endPosition);
      canvas.addEventListener("mousemove", draw);

      // Touch events
      canvas.addEventListener("touchstart", startPosition);
      canvas.addEventListener("touchend", endPosition);
      canvas.addEventListener("touchmove", draw);

      function startPosition(e) {
          painting = true;
          draw(e);
      }

      function endPosition() {
          painting = false;
          ctx.beginPath();
      }

      function draw(e) {
          if (!painting) return;
          ctx.lineWidth = 5;
          ctx.lineCap = "round";
          ctx.strokeStyle = "#000";

          // Get touch or mouse coordinates
          var x, y;
          if (e.type.startsWith("touch")) {
              x = e.touches[0].clientX - canvas.offsetLeft;
              y = e.touches[0].clientY - canvas.offsetTop;
          } else {
              x = e.clientX - canvas.offsetLeft;
              y = e.clientY - canvas.offsetTop;
          }

          ctx.lineTo(x, y);
          ctx.stroke();
          ctx.beginPath();
          ctx.moveTo(x, y);
      }
      // Function to resize the canvas
      // function resizeCanvas(newWidth, newHeight) {
      //     // Save the drawing
      //     const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);

      //     // Resize the canvas
      //     canvas.width = newWidth;
      //     canvas.height = newHeight;

      //     // Restore the drawing with scaling
      //     // ctx.putImageData(imageData, 0, 0);
      //     // ctx.scale(newWidth / initialWidth, newHeight / initialHeight);
      // }

      // // Example of resizing the canvas (you can trigger this as needed)
      // resizeCanvas(600, 400);
  }
}
