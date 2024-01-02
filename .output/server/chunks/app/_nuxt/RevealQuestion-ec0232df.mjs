import { mergeProps, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrInterpolate, ssrRenderList } from 'vue/server-renderer';
import { _ as _export_sfc } from '../server.mjs';

const _sfc_main = {
  props: {
    q: Object
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "w-1/2 p-4 my-5 text-center rounded-md shadow-md bg-sg-white" }, _attrs))}><h2 class="text-3xl">Question: ${ssrInterpolate($props.q.question)}</h2><h3 class="text-2xl">Correct Answer: ${ssrInterpolate($props.q.correctAnswer || $props.q.correct)}</h3><h3 class="text-2xl">Wrong Answers: <!--[-->`);
  ssrRenderList($props.q.wrongAnswers || $props.q.options, (o) => {
    _push(`<ul>${ssrInterpolate(o)}</ul>`);
  });
  _push(`<!--]--></h3></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/RevealQuestion.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const __nuxt_component_0 = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { __nuxt_component_0 as _ };
//# sourceMappingURL=RevealQuestion-ec0232df.mjs.map
