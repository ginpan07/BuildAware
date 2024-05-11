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
    colorButton.style.width = "9em";
    colorButton.style.height = "3.3em";
    colorButton.style.margin = "10px";
    colorButton.style.backgroundColor = "#f6f193";
    colorButton.style.border = "6px outset #d4d081";
    colorButton.style.borderRadius = "10px";
    colorButton.style.outline = "2px solid black";
    colorButton.style.boxShadow = "0 0 0 1px black inset";
    colorButton.style.verticalAlign = "middle";
    colorButton.value = "#000"; // Default color is black
    colorButton.addEventListener("change", (e) => {
      this.selectedColor = e.target.value;
      this.isErasing = false; // Disable eraser when changing color
    });

    // Button to change brush size
    const brushSizeButton = document.createElement("input");
    brushSizeButton.type = "number";
    brushSizeButton.style.fontFamily = "Happy Monkey, cursive";
    brushSizeButton.style.fontSize = "18px";
    brushSizeButton.style.fontWeight = "bold";
    brushSizeButton.style.width = "8em";
    brushSizeButton.style.height = "3em";
    brushSizeButton.style.margin = "10px";
    brushSizeButton.style.backgroundColor = "#f6f193";
    brushSizeButton.style.border = "6px outset #d4d081";
    brushSizeButton.style.borderRadius = "10px";
    brushSizeButton.style.outline = "2px solid black";
    brushSizeButton.style.boxShadow = "0 0 0 1px black inset";
    brushSizeButton.min = 1;
    brushSizeButton.max = 100;
    brushSizeButton.value = this.brushSize;
    brushSizeButton.addEventListener("change", (e) => {
      this.brushSize = parseInt(e.target.value);
      this.isErasing = false; // Disable eraser when changing brush size
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
    button.style.fontSize = "18px";
    button.style.fontWeight = "bold";
    button.style.width = "8em";
    button.style.height = "3em";
    button.style.margin = "10px";
    button.style.backgroundColor = "#f6f193";
    button.style.border = "6px outset #d4d081";
    button.style.borderRadius = "10px";
    button.style.outline = "2px solid black";
    button.style.boxShadow = "0 0 0 1px black inset";

    button.addEventListener("mouseenter", function() {
      button.style.backgroundColor = "#d4d081";
      button.style.borderStyle = "inset";
    });

    button.addEventListener("mouseleave", function() {
      button.style.backgroundColor = "#f6f193";
      button.style.border = "6px outset #d4d081";
      button.style.borderRadius = "10px";
      button.style.outline = "2px solid black";
      button.style.boxShadow = "0 0 0 1px black inset";
    });

    return button;
  }
}

document.addEventListener("DOMContentLoaded", function() {
  let popup = document.getElementById("popup");
  let customAnswerButton = document.getElementById("customAnswerButton");

  // Bind click event to the "Add Custom Answer" button
  customAnswerButton.addEventListener("click", function() {
    displayPopup();
  });

  // Bind click event to the "Submit" link within the modal
  document.getElementById("submitLink").addEventListener("click", function(event) {
    event.preventDefault(); // Prevent the default action (navigation)
    closePopup();
  });

  function displayPopup() {
    popup.style.display = 'block';
  }

  function closePopup() {
    popup.style.display = 'none';
  }
});
