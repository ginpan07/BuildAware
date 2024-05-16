import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["myCanvas"];

  selectedColor = "#000"; // Default color is black
  canvasWidth = 800; // Default canvas width
  canvasHeight = 400; // Default canvas height
  brushSize = 5; // Default brush size
  isErasing = false; // Whether eraser mode is enabled

  connect() {
    this.setupCanvas();
    window.addEventListener("resize", this.setupCanvas.bind(this));

    const canvas = this.myCanvasTarget;
    const ctx = canvas.getContext("2d");
    let painting = false;

    canvas.addEventListener("mousedown", startPosition);
    canvas.addEventListener("mouseup", endPosition);
    canvas.addEventListener("mousemove", draw);

    // Touch events
    canvas.addEventListener("touchstart", startPosition);
    canvas.addEventListener("touchend", endPosition);
    canvas.addEventListener("touchmove", draw);

    // Button to clear canvas
    const clearButton = this.createButton("Clear Canvas");
    clearButton.addEventListener("click", clearCanvas);

    // Button to select color
    const colorButton = document.createElement("input");
    colorButton.type = "color";
    colorButton.style.height = "8vh";
    colorButton.style.width = "8em";
    colorButton.style.position = "relative";
    colorButton.style.bottom = "0px";
    colorButton.style.margin = "10px";
    colorButton.style.backgroundColor = "rgba(164, 163, 165, 0.5)";
    colorButton.style.border = "1px solid rgba(59, 159, 214, 0.2)";
    colorButton.style.borderRadius = "50px";
    colorButton.style.boxShadow = "10px 10px 5px lightblue";
    colorButton.style.verticalAlign = "middle";
    colorButton.style.overflow = "hidden";
    colorButton.value = "#000"; // Default color is black
    colorButton.addEventListener("change", (e) => {
      this.selectedColor = e.target.value;
      this.isErasing = false; // Disable eraser when changing color
    });

    // Button to change brush size
    const brushSizeButton = document.createElement("input");
    brushSizeButton.type = "number";
    brushSizeButton.style.fontFamily = "Happy Monkey, cursive";
    brushSizeButton.style.textAlign = "center";
    brushSizeButton.style.fontSize = "1.3vw";
    brushSizeButton.style.fontWeight = "bold";
    brushSizeButton.style.width = "8em";
    brushSizeButton.style.height = "8vh";
    brushSizeButton.style.margin = "10px";
    brushSizeButton.style.backgroundColor = "rgba(164, 163, 165, 0.5)";
    brushSizeButton.style.border = "1px solid rgba(59, 159, 214, 0.2)";
    brushSizeButton.style.borderRadius = "40px";
    brushSizeButton.style.boxShadow = "10px 10px 5px lightblue";
    brushSizeButton.min = 1;
    brushSizeButton.max = 100;
    brushSizeButton.value = this.brushSize;
    brushSizeButton.addEventListener("change", (e) => {
      this.brushSize = parseInt(e.target.value);
   // Disable eraser when changing brush size
    });

    // Button to toggle eraser mode
    const eraserButton = this.createButton("Eraser");
    eraserButton.addEventListener("click", toggleEraser);

    const container = document.getElementById("canvas-container");
    container.appendChild(colorButton);
    container.appendChild(brushSizeButton);
    container.appendChild(eraserButton);
    container.appendChild(clearButton);

    const controller = this;

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
      ctx.lineWidth = controller.brushSize;
      ctx.lineCap = "round";

      if (controller.isErasing) {
        ctx.strokeStyle = "#ffffff"; // Set color to white for eraser
      } else {
        ctx.strokeStyle = controller.selectedColor;
      }

      let x, y;
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

    function clearCanvas() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
    }

    function toggleEraser() {
      controller.isErasing = !controller.isErasing;
      eraserButton.textContent = controller.isErasing ? "Brush" : "Eraser";
    }
  }

  setupCanvas() {
    const canvas = this.myCanvasTarget;
    const container = document.getElementById("canvas-container");
    const rect = container.getBoundingClientRect();

    this.canvasWidth = rect.width;
    this.canvasHeight = rect.height;

    canvas.width = this.canvasWidth;
    canvas.height = this.canvasHeight;
  }

  createButton(text) {
    const button = document.createElement("button");
    button.textContent = text;
    button.classList.add("canvas-button");
    button.style.fontFamily = "Happy Monkey, cursive";
    button.style.fontSize = "1.3vw";
    button.style.fontWeight = "bold";
    button.style.width = "8em";
    button.style.height = "8vh";
    button.style.margin = "10px";
    button.style.backgroundColor = "rgba(164, 163, 165, 0.5)";
    button.style.border = "1px solid rgba(59, 159, 214, 0.2)";
    button.style.borderRadius = "40px";
    button.style.boxShadow = "10px 10px 5px lightblue";

    button.addEventListener("mouseenter", function() {
      button.style.backgroundColor = "#ffcb3d";
      button.style.borderStyle = "inset";
    });

    button.addEventListener("mouseleave", function() {
      button.style.backgroundColor = "rgba(164, 163, 165, 0.5)";
      button.style.border = "1px solid rgba(59, 159, 214, 0.2)";
      button.style.borderRadius = "40px";
      button.style.boxShadow = "10px 10px 5px lightblue";
    });

    return button;
  }
}
