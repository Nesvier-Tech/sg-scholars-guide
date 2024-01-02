import { g as getClient } from "./SGDB-028e8699.js";
import { Account } from "appwrite";
import { resolveComponent, mergeProps, withCtx, createTextVNode, useSSRContext } from "vue";
import { ssrRenderAttrs, ssrInterpolate, ssrRenderComponent } from "vue/server-renderer";
import { _ as _export_sfc } from "../server.mjs";
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
const index_vue_vue_type_style_index_0_lang = "";
const client = getClient();
const account = new Account(client);
const _sfc_main = {
  data() {
    return {
      email: ""
    };
  },
  methods: {
    async resetPassword() {
      try {
        const promise = account.createVerification("https://example.com");
        console.log(`sending email verification... (${this.email})`);
        promise.then(function(response) {
          console.log(response);
          alert("Email verification sent!");
        }, function(error) {
          console.log(error);
          alert(`Email verification failed!
${error.message}`);
        });
      } catch (error) {
        console.error("Email verification failed", error);
        alert1("Email verification failed!");
      }
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_router_link = resolveComponent("router-link");
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "min-h-screen flex items-center justify-center bg-gray-100" }, _attrs))}><div class="max-w-md w-full bg-white p-8 shadow-md rounded-md"><h2 class="text-3xl font-semibold mb-6">Email Verification</h2><p class="mb-4">Thank you for signing up! A verification email has been sent to ${ssrInterpolate($data.email)}. Please check your email and click on the verification link to activate your account.</p>`);
  _push(ssrRenderComponent(_component_router_link, {
    to: "/login",
    class: "block text-center text-blue-500 hover:underline"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Return to Login`);
      } else {
        return [
          createTextVNode("Return to Login")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</div></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/email-verification/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  index as default
};
//# sourceMappingURL=index-2b55b807.js.map
