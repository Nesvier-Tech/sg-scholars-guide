import { _ as __nuxt_component_0 } from "./RevealQuestion-ec0232df.js";
import { _ as __nuxt_component_1 } from "./Button-78b8217b.js";
import { _ as _export_sfc, a as __nuxt_component_0$1 } from "../server.mjs";
import { mergeProps, withCtx, createTextVNode, createVNode, toDisplayString, useSSRContext } from "vue";
import { ssrRenderAttrs, ssrInterpolate, ssrRenderList, ssrRenderComponent } from "vue/server-renderer";
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
const _sfc_main = {
  methods: {
    visitSubmitted() {
      this.$router.push({
        path: "/upload/submissions",
        query: {
          subject: this.$route.query.subject
        }
      });
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_RevealQuestion = __nuxt_component_0;
  const _component_Button = __nuxt_component_1;
  const _component_nuxt_link = __nuxt_component_0$1;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "items-center" }, _attrs))}><h1 class="flex justify-center mt-10 text-3xl font-bold text-green-500">Success!</h1><h1 class="flex justify-center p-5 text-2xl font-bold">Uploaded under ${ssrInterpolate(_ctx.$route.query.subject)}. Here&#39;s what you uploaded:</h1><div class="flex flex-col items-center p-2"><!--[-->`);
  ssrRenderList(JSON.parse(this.$route.query.questions), (question) => {
    _push(ssrRenderComponent(_component_RevealQuestion, { q: question }, null, _parent));
  });
  _push(`<!--]--></div>`);
  _push(ssrRenderComponent(_component_Button, { class: "flex justify-center p-2" }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(ssrRenderComponent(_component_nuxt_link, { to: "/upload" }, {
          default: withCtx((_2, _push3, _parent3, _scopeId2) => {
            if (_push3) {
              _push3(`Submit Again`);
            } else {
              return [
                createTextVNode("Submit Again")
              ];
            }
          }),
          _: 1
        }, _parent2, _scopeId));
      } else {
        return [
          createVNode(_component_nuxt_link, { to: "/upload" }, {
            default: withCtx(() => [
              createTextVNode("Submit Again")
            ]),
            _: 1
          })
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(ssrRenderComponent(_component_Button, {
    class: "flex justify-center",
    onClick: $options.visitSubmitted
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`View ${ssrInterpolate(_ctx.$route.query.subject)} Questions`);
      } else {
        return [
          createTextVNode("View " + toDisplayString(_ctx.$route.query.subject) + " Questions", 1)
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/upload/success.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const success = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  success as default
};
//# sourceMappingURL=success-756e265a.js.map
