import { _ as __nuxt_component_0 } from "./RevealQuestion-ec0232df.js";
import { S as SGDB } from "./SGDB-028e8699.js";
import { mergeProps, useSSRContext } from "vue";
import { ssrRenderAttrs, ssrInterpolate, ssrRenderList, ssrRenderComponent } from "vue/server-renderer";
import { _ as _export_sfc } from "../server.mjs";
import "appwrite";
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
const { get_questions, SUBJECTS } = SGDB();
const SUBJ = {
  "Math": SUBJECTS.MATH,
  "Science": SUBJECTS.SCI,
  "Language Proficiency": SUBJECTS.LANG_PROF,
  "Reading Comprehension": SUBJECTS.READ_COMP
};
const _sfc_main = {
  data: () => {
    return {
      questions: []
    };
  },
  watch: {
    questions: function() {
      console.log("CHANGED!");
    }
  },
  created() {
    get_questions(SUBJ[this.$route.query.subject]).then((questions) => {
      this.questions = questions.documents;
      console.log(this.questions);
    });
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_RevealQuestion = __nuxt_component_0;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col items-center p-2" }, _attrs))}><h1 class="p-5 mt-5 text-3xl font-bold">${ssrInterpolate(_ctx.$route.query.subject)}: ${ssrInterpolate(_ctx.questions.length)} Total Submissions</h1><!--[-->`);
  ssrRenderList(_ctx.questions, (question) => {
    _push(ssrRenderComponent(_component_RevealQuestion, { q: question }, null, _parent));
  });
  _push(`<!--]--></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/upload/submissions.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const submissions = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  submissions as default
};
//# sourceMappingURL=submissions-b6af3a51.js.map
