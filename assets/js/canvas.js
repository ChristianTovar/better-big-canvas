export const Canvas = (hook) => {
  const canvas = document.getElementById(hook.el.id);
  let ctx = canvas.getContext("2d");
  const pixels = JSON.parse(hook.el.getAttribute("data-pixels"));

  for (let x = 0; x < 30; x++) {
    for (let y = 0; y < 30; y++) {
      ctx.fillStyle = pixels[y];
      ctx.fillRect(y, x, 1, 1);
    }
    pixels.splice(0, 30);
  }
};
