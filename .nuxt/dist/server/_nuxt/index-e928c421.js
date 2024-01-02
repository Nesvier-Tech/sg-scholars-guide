import { g as getClient } from "./SGDB-028e8699.js";
import { Account } from "appwrite";
import { resolveComponent, mergeProps, withCtx, createTextVNode, useSSRContext } from "vue";
import { ssrRenderAttrs, ssrRenderAttr, ssrRenderComponent } from "vue/server-renderer";
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
        const promise = account.createRecovery(this.email, "https://example.com");
        console.log(`sending password reset email... (${this.email})`);
        promise.then(function(response) {
          console.log(response);
          alert("Password reset email sent!");
        }, function(error) {
          console.log(error);
          alert(`Password reset failed!
${error.message}`);
        });
      } catch (error) {
        console.error("Password reset failed", error);
        alert("Password reset failed!");
      }
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_router_link = resolveComponent("router-link");
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "min-h-screen flex items-center justify-center bg-gray-100" }, _attrs))}><div class="max-w-md w-full bg-white p-8 shadow-md rounded-md"><h2 class="text-3xl font-semibold mb-6">Forgot Password</h2><form><div class="mb-4"><label for="email" class="block text-gray-700 text-sm font-medium mb-2">Email Address</label><input${ssrRenderAttr("value", $data.email)} type="email" id="email" name="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Reset Password</button></form><div class="mt-4 text-center"><p class="text-sm">Remember your password? `);
  _push(ssrRenderComponent(_component_router_link, {
    to: "/auth/login",
    class: "text-blue-500 hover:underline"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Login here.`);
      } else {
        return [
          createTextVNode("Login here.")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`</p></div></div></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/forgot-password/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  index as default
};
//# sourceMappingURL=index-e928c421.js.map
