import Pickr from "@simonwep/pickr";
import "@simonwep/pickr/dist/themes/nano.min.css";

export const ColorPickr = (hook) => {
  const pickr = Pickr.create({
    el: hook.el,
    theme: "nano",
    closeOnScroll: true,
    closeWithKey: "Escape",
    default: "#42445a",

    components: {
      preview: true,
      opacity: true,
      hue: true,

      interaction: {
        input: true,
      },
    },
  });

  pickr.on("change", (instance) => {
    hook.pushEvent("select-color", { color: instance.toHEXA().join("") });
  });
};
