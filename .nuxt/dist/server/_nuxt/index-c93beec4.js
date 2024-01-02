import { _ as _export_sfc, a as __nuxt_component_0 } from "../server.mjs";
import { withCtx, createTextVNode, useSSRContext } from "vue";
import { ssrRenderComponent, ssrRenderAttr } from "vue/server-renderer";
import "#internal/nitro";
import "ofetch";
import "hookable";
import "unctx";
import "unhead";
import "@unhead/shared";
import "vue-router";
import "h3";
import "ufo";
import "destr";
import "defu";
import "klona";
import "devalue";
const _imports_0 = "" + __buildAssetsURL("nav-map.5e3995f6.png");
const _sfc_main = {};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs) {
  const _component_nuxt_link = __nuxt_component_0;
  _push(`<!--[--><div><h1 class="flex justify-center my-3 text-2xl font-bold">Index Page</h1><ul class="flex flex-col items-center"><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "test" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Scratch`);
      } else {
        return [
          createTextVNode("Scratch")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "/auth/login" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Login`);
      } else {
        return [
          createTextVNode("Login")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "dashboard" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Dashboard`);
      } else {
        return [
          createTextVNode("Dashboard")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "upload" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Upload Quiz`);
      } else {
        return [
          createTextVNode("Upload Quiz")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "quiz" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Take Quiz`);
      } else {
        return [
          createTextVNode("Take Quiz")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li><li class="px-4 my-2 border-2 rounded-md">`);
  _push(ssrRenderComponent(_component_nuxt_link, { to: "profile" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Profile`);
      } else {
        return [
          createTextVNode("Profile")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</li></ul><h3 class="ml-10 font-bold text-1xl">*Let&#39;s temporarily use this as temporary navigator</h3></div><hr><div class="flex flex-col items-center my-10"><h2 class="my-3 text-2xl font-bold">Navigation Map</h2><img${ssrRenderAttr("src", _imports_0)} width="600" height="1000"></div><!--]-->`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  index as default
};
//# sourceMappingURL=index-c93beec4.js.map
