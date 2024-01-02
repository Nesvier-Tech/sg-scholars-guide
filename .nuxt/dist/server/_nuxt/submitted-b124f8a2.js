import { a as get_questions, b as getSubjects } from "./SGDB-028e8699.js";
import { ssrRenderList, ssrInterpolate } from "vue/server-renderer";
import { useSSRContext } from "vue";
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
const _sfc_main = {
  data: () => {
    return {
      questions: void 0
    };
  },
  watch: {
    questions: function() {
      console.log("CHANGED!");
    }
  },
  created() {
    get_questions(getSubjects().MATH).then((questions) => {
      this.questions = questions.documents;
      console.log(questions);
    });
  },
  methods: {}
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  _push(`<!--[-->`);
  ssrRenderList(_ctx.questions, (q) => {
    _push(`<ul><div id="question-box"><h2>Question: ${ssrInterpolate(q.question)}</h2><h3>Correct Answer: ${ssrInterpolate(q.correctAnswer)}</h3><h3>Wrong Answers: <!--[-->`);
    ssrRenderList(q.wrongAnswers, (o) => {
      _push(`<ul>${ssrInterpolate(o)}</ul>`);
    });
    _push(`<!--]--></h3></div></ul>`);
  });
  _push(`<!--]-->`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/upload/submitted.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const submitted = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);
export {
  submitted as default
};
//# sourceMappingURL=submitted-b124f8a2.js.map
