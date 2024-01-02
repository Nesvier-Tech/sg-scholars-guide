import { g as getClient } from './SGDB-028e8699.mjs';
import { Account } from 'appwrite';
import { mergeProps, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderAttr } from 'vue/server-renderer';
import { _ as _export_sfc } from '../server.mjs';
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

const client = getClient();
const account = new Account(client);
const _sfc_main = {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    async login() {
      try {
        const promise = account.createEmailSession(this.email, this.password);
        console.log(`logging you in... (${this.email} ${this.password})`);
        promise.then(function(response) {
          console.log(response);
          alert(`Login Successful!`);
        }, function(error) {
          console.log(error);
          alert(`Login failed!
${error.message}`);
        });
      } catch (error) {
        console.error("Login Failed", error);
        alert(`Login Failed!`);
      }
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "min-h-screen flex items-center justify-center bg-gray-100" }, _attrs))}><div class="max-w-md w-full bg-white p-8 shadow-md rounded-md"><h2 class="text-3xl font-semibold mb-6">Login</h2><form><div class="mb-4"><label for="email" class="block text-gray-700 text-sm font-medium mb-2">Email Address</label><input${ssrRenderAttr("value", $data.email)} type="email" id="email" name="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><div class="mb-4"><label for="password" class="block text-gray-700 text-sm font-medium mb-2">Password</label><input${ssrRenderAttr("value", $data.password)} type="password" id="password" name="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><div class="mb-4 text-right"><a href="/auth/forgot-password" class="text-sm text-blue-500 hover:underline">Forgot Password?</a></div><button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Login</button></form><div class="mt-4 text-center"><p class="text-sm">Don&#39;t have an account? <a href="/auth/sign-up" class="text-blue-500 hover:underline">Create now.</a></p></div></div></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/login/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { index as default };
//# sourceMappingURL=index-88c37784.mjs.map
