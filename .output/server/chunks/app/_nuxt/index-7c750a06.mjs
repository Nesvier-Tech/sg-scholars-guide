import { _ as _export_sfc, a as __nuxt_component_0$1 } from '../server.mjs';
import { useSSRContext, mergeProps, withCtx, createVNode, toDisplayString } from 'vue';
import { ssrRenderAttrs, ssrRenderStyle, ssrRenderComponent, ssrInterpolate } from 'vue/server-renderer';
import '../../nitro/node-server.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'unhead';
import '@unhead/shared';
import 'vue-router';

const _sfc_main$1 = {
  props: {
    title: String,
    subtext: String,
    description: String
  }
};
function _sfc_ssrRender$1(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_nuxt_link = __nuxt_component_0$1;
  _push(ssrRenderComponent(_component_nuxt_link, mergeProps({
    to: { name: "quiz" },
    class: "no-underline"
  }, _attrs), {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`<div class="flex flex-col rounded overflow-hidden shadow-lg bg-white hover:bg-gray-100 transition-colors" data-v-262566ff${_scopeId}><div class="px-6 py-4 bg-red-500 text-white" data-v-262566ff${_scopeId}><div class="font-bold text-xl mb-2" data-v-262566ff${_scopeId}>${ssrInterpolate($props.title)}</div><p class="text-base" data-v-262566ff${_scopeId}>${ssrInterpolate($props.subtext)}</p></div><div class="px-6 py-4 flex-grow" data-v-262566ff${_scopeId}><p class="text-gray-700 text-base" data-v-262566ff${_scopeId}>${ssrInterpolate($props.description)}</p></div></div>`);
      } else {
        return [
          createVNode("div", { class: "flex flex-col rounded overflow-hidden shadow-lg bg-white hover:bg-gray-100 transition-colors" }, [
            createVNode("div", { class: "px-6 py-4 bg-red-500 text-white" }, [
              createVNode("div", { class: "font-bold text-xl mb-2" }, toDisplayString($props.title), 1),
              createVNode("p", { class: "text-base" }, toDisplayString($props.subtext), 1)
            ]),
            createVNode("div", { class: "px-6 py-4 flex-grow" }, [
              createVNode("p", { class: "text-gray-700 text-base" }, toDisplayString($props.description), 1)
            ])
          ])
        ];
      }
    }),
    _: 1
  }, _parent));
}
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/Card.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_0 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender$1], ["__scopeId", "data-v-262566ff"]]);
const _sfc_main = {
  name: "Dashboard",
  components: {
    Card: __nuxt_component_0
  }
  // Data, methods, etc. might go here
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_Card = __nuxt_component_0;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "container mx-auto p-4" }, _attrs))} data-v-4c9a3016><div class="profile bg-gray-50 shadow rounded overflow-hidden border border-gray-300 p-4 flex flex-col items-start" data-v-4c9a3016><div class="header self-stretch flex justify-end items-center gap-2 p-2" data-v-4c9a3016><div class="dots-horizontal w-5 h-5 relative" data-v-4c9a3016><div class="vector w-4 h-1 bg-gray-500 absolute" style="${ssrRenderStyle({ "left": "3px", "top": "50%" })}" data-v-4c9a3016></div></div></div><div class="avatar-name self-stretch flex flex-col items-center gap-3" data-v-4c9a3016><img class="avatar w-24 h-24 rounded-full shadow-md" src="https://via.placeholder.com/96x96" data-v-4c9a3016><div class="name-role self-stretch flex flex-col items-center gap-1" data-v-4c9a3016><div class="name text-xl font-semibold text-gray-900" data-v-4c9a3016>Marc Charles Torezar</div><div class="role text-gray-500" data-v-4c9a3016>@noobinator69</div></div></div><div class="buttons self-stretch flex justify-center items-center gap-3 pt-6" data-v-4c9a3016><button class="edit-profile bg-yellow-400 text-white px-3 py-2 rounded flex items-center gap-2 text-sm" data-v-4c9a3016>Edit Profile</button></div></div><div class="course-overview mt-10 relative" data-v-4c9a3016><div class="rectangle1 bg-gray-50 shadow rounded p-4" data-v-4c9a3016><div class="text-black font-bold text-3xl mb-4" data-v-4c9a3016>Course Overview</div><div class="carousel rounded overflow-hidden" data-v-4c9a3016><div class="flex justify-center items-stretch space-x-4 my-8" data-v-4c9a3016>`);
  _push(ssrRenderComponent(_component_Card, {
    class: "flex-grow flex-basis-0",
    title: "Reading Comprehension",
    subtext: "UPCAT Subtest",
    description: "Reading comprehension is the ability to process written text, understand its meaning."
  }, null, _parent));
  _push(ssrRenderComponent(_component_Card, {
    class: "flex-grow flex-basis-0",
    title: "Mathematics",
    subtext: "UPCAT Subtest",
    description: "Basic and intermediate algebra, geometry, statistics, and in some cases, a bit of trigonometry."
  }, null, _parent));
  _push(ssrRenderComponent(_component_Card, {
    class: "flex-grow flex-basis-0",
    title: "Science",
    subtext: "UPCAT Subtest",
    description: "Earth science and basic astronomy, biology, basic chemistry, and basic physics."
  }, null, _parent));
  _push(ssrRenderComponent(_component_Card, {
    class: "flex-grow flex-basis-0",
    title: "Language Proficiency",
    subtext: "UPCAT Subtest",
    description: "Vocabulary, synonyms and antonyms, spelling, correct usage and grammar."
  }, null, _parent));
  _push(`</div></div></div></div></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender], ["__scopeId", "data-v-4c9a3016"]]);

export { index as default };
//# sourceMappingURL=index-7c750a06.mjs.map
