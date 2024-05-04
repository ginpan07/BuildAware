import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["myCanvas"];

  // Add a variable to store the selected color
  selectedColor = "#000"; // Default color is black

  connect() {
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
    const clearButton = document.createElement("button");
    clearButton.textContent = "Clear Canvas";
    clearButton.classList.add("clear-canvas-button");
    clearButton.style.position = "relative";
    clearButton.style.fontFamily = "Happy Monkey, cursive";
    clearButton.style.fontSize = "18px";
    clearButton.style.fontWeight = "bold";
    clearButton.style.width = "200px";
    clearButton.style.height = "60px";
    clearButton.style.bottom = "110px";
    clearButton.style.left = "350px";
    clearButton.style.padding = "10px";
    clearButton.style.backgroundColor = "#f6f193";
    clearButton.style.border = "6px outset #d4d081";
    clearButton.style.borderRadius = "10px";
    clearButton.style.outline = "2px solid black";
    clearButton.style.boxShadow = "0 0 0 1px black inset";

    clearButton.addEventListener("mouseenter", function() {
      clearButton.style.backgroundColor = "#d4d081";
      clearButton.style.borderStyle = "inset";
    });

    clearButton.addEventListener("mouseleave", function() {
      clearButton.style.backgroundColor = "#f6f193";
      clearButton.style.border = "6px outset #d4d081";
      clearButton.style.borderRadius = "10px";
      clearButton.style.outline = "2px solid black";
      clearButton.style.boxShadow = "0 0 0 1px black inset";
    });

    clearButton.addEventListener("click", clearCanvas);
    this.element.appendChild(clearButton);

    // Button to select color
    const colorButton = document.createElement("input");
    colorButton.type = "color";
    colorButton.value = "#000"; // Default color is black
    colorButton.style.position = "relative";
    colorButton.style.bottom = "170px";
    colorButton.style.left = "150px";
    colorButton.style.width = "200px";
    colorButton.style.height = "60px";
    colorButton.style.border = "6px outset #d4d081";
    colorButton.style.borderRadius = "10px";
    colorButton.style.outline = "2px solid black";
    colorButton.style.boxShadow = "0 0 0 1px black inset";
    colorButton.addEventListener("change", (e) => {
      this.selectedColor = e.target.value;
    });
    this.element.appendChild(colorButton);

    // Capture the controller instance
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
      ctx.lineWidth = 5;
      ctx.lineCap = "round";

      // Use the selected color from the controller instance
      ctx.strokeStyle = controller.selectedColor;

      // Get touch or mouse coordinates
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
  }
}
