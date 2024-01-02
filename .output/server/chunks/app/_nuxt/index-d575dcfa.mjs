import { g as getClient } from './SGDB-028e8699.mjs';
import { Account } from 'appwrite';
import { resolveComponent, mergeProps, withCtx, createTextVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderAttr, ssrRenderComponent } from 'vue/server-renderer';
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
      username: "",
      email: "",
      password: "",
      confirmPassword: ""
    };
  },
  methods: {
    async signup() {
      try {
        if (this.password !== this.confirmPassword) {
          console.error("Passwords do not match");
          alert("Are you f***ing blind?! Passwords do not match!");
          return;
        }
        let userID = Date.now().toString();
        const promise = account.create(userID, this.email, this.password, this.username);
        console.log(`creating user... (${this.email})`);
        promise.then(function(response) {
          console.log(response);
          alert("User created!");
        }, function(error) {
          console.log(error);
          alert(`User creation failed!
${error.message}`);
        });
      } catch (error) {
        console.error("Signup Failed", error);
        alert("Signup failed!");
      }
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_router_link = resolveComponent("router-link");
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "min-h-screen flex items-center justify-center bg-gray-100" }, _attrs))}><div class="max-w-md w-full bg-white p-8 shadow-md rounded-md"><h2 class="text-3xl font-semibold mb-6">Sign Up</h2><form><div class="mb-4"><label for="username" class="block text-gray-700 text-sm font-medium mb-2">Username</label><input${ssrRenderAttr("value", $data.username)} type="text" id="username" name="username" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><div class="mb-4"><label for="email" class="block text-gray-700 text-sm font-medium mb-2">Email Address</label><input${ssrRenderAttr("value", $data.email)} type="email" id="email" name="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><div class="mb-4"><label for="password" class="block text-gray-700 text-sm font-medium mb-2">Password</label><input${ssrRenderAttr("value", $data.password)} type="password" id="password" name="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><div class="mb-4"><label for="confirmPassword" class="block text-gray-700 text-sm font-medium mb-2">Confirm Password</label><input${ssrRenderAttr("value", $data.confirmPassword)} type="password" id="confirmPassword" name="confirmPassword" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" required></div><button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Sign Up</button></form><div class="mt-4 text-center"><p class="text-sm">Already have an account? `);
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/sign-up/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { index as default };
//# sourceMappingURL=index-d575dcfa.mjs.map
