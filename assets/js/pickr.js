import Pickr from "@simonwep/pickr";
import "@simonwep/pickr/dist/themes/nano.min.css";

export const ColorPickr = (hook) => {
  const pickr = Pickr.create({
    el: hook.el,
    theme: "nano",
    closeOnScroll: true,
    closeWithKey: "Escape",
    default: "#DF1010",

    components: {
      hue: true,

      interaction: {
        input: true,
      },
    },
  });

  pickr.on("change", (instance) => {
    const selectedColor = instance.toHEXA().toString();
    hook.pushEvent("select-color", { color: selectedColor });
  });
};
