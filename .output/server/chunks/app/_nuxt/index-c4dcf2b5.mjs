import { _ as __nuxt_component_1$1 } from './Button-78b8217b.mjs';
import { useSSRContext, mergeProps, withCtx, createTextVNode, openBlock, createBlock, createVNode } from 'vue';
import { ssrRenderAttrs, ssrInterpolate, ssrRenderComponent, ssrRenderList, ssrRenderAttr, ssrIncludeBooleanAttr, ssrLooseEqual, ssrRenderClass } from 'vue/server-renderer';
import { _ as _export_sfc } from '../server.mjs';
import { S as SGDB } from './SGDB-028e8699.mjs';
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
import 'appwrite';

const _sfc_main$1 = {
  data: () => {
    return {
      selectedOption: "0"
    };
  },
  props: {
    id: Number,
    question: String,
    options: Array,
    correct: String
  },
  methods: {
    update() {
      let c;
      let o = [];
      const get_options = document.getElementsByClassName(`option${this.id}`);
      for (let i = 0; i < get_options.length; i++) {
        if (i === Number(this.selectedOption)) {
          c = get_options[i].value;
        } else
          o.push(get_options[i].value);
      }
      this.$emit("update", {
        id: this.id,
        question: document.getElementById(`question${this.id}`).value,
        options: o,
        correct: c
      });
    }
  }
};
function _sfc_ssrRender$1(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  _push(`<div${ssrRenderAttrs(mergeProps({ id: "question-box" }, _attrs))}><textarea class="h-32 w-96"${ssrRenderAttr("id", "question" + $props.id)} placeholder="Place your question here" required></textarea><div id="option"><input type="radio" value="0"${ssrIncludeBooleanAttr(ssrLooseEqual(_ctx.selectedOption, "0")) ? " checked" : ""} required><input type="text" class="${ssrRenderClass("option" + $props.id)}" placeholder="Put your option here" required></div><div id="option"><input type="radio" value="1"${ssrIncludeBooleanAttr(ssrLooseEqual(_ctx.selectedOption, "1")) ? " checked" : ""} required><input type="text" class="${ssrRenderClass("option" + $props.id)}" placeholder="Put your option here" required></div><div id="option"><input type="radio" value="2"${ssrIncludeBooleanAttr(ssrLooseEqual(_ctx.selectedOption, "2")) ? " checked" : ""} required><input type="text" class="${ssrRenderClass("option" + $props.id)}" placeholder="Put your option here" required></div><div id="option"><input type="radio" value="3"${ssrIncludeBooleanAttr(ssrLooseEqual(_ctx.selectedOption, "3")) ? " checked" : ""} required><input type="text" class="${ssrRenderClass("option" + $props.id)}" placeholder="Put your option here" required></div></div>`);
}
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/CreateQuestion.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_1 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender$1]]);
const { post_questions, SUBJECTS } = SGDB();
const SUBJ = {
  "Math": SUBJECTS.MATH,
  "Science": SUBJECTS.SCI,
  "Language Proficiency": SUBJECTS.LANG_PROF,
  "Reading Comprehension": SUBJECTS.READ_COMP
};
const _sfc_main = {
  data() {
    return {
      subj: "Science",
      count: 0,
      questions: [{
        id: 0,
        question: "",
        options: [],
        correct: "",
        authorID: "a"
      }],
      showRemoveButton: false
    };
  },
  methods: {
    updateQuestion(data) {
      this.questions[data.id].question = data.question;
      this.questions[data.id].options = data.options;
      this.questions[data.id].correct = data.correct;
    },
    addQuestion() {
      this.count++;
      const q = {
        id: this.count,
        question: "",
        options: [],
        correct: "",
        authorID: "a"
      };
      this.questions.push(q);
      if (this.questions.length > 1)
        this.showRemoveButton = true;
    },
    removeQuestion() {
      if (this.questions.length > 1) {
        this.questions.pop();
        this.count--;
      }
      if (this.questions.length === 1)
        this.showRemoveButton = false;
    },
    submitQuestion() {
      for (const q of this.questions) {
        if (q.question === "" || q.options.some((e) => e === "") || q.correct === "") {
          document.getElementById("incomplete").classList.remove("hidden");
          return;
        }
      }
      post_questions(SUBJ[this.subj], this.questions);
      this.$router.push({
        path: "/upload/success",
        query: {
          subject: this.subj,
          questions: JSON.stringify(this.questions)
        }
      });
    }
  }
};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_Button = __nuxt_component_1$1;
  const _component_CreateQuestion = __nuxt_component_1;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "p-4" }, _attrs))}><h1 class="flex justify-center p-4 text-2xl font-bold">Choose a Subject to Upload Questions</h1><div class="inline-flex justify-center w-full p-2 bg-white border-2 rounded-md md:w-auto md:flex">${ssrInterpolate($data.subj)}</div>`);
  _push(ssrRenderComponent(_component_Button, {
    id: "dropdownDefaultbutton",
    onclick: "const d = document.getElementById('dropdown'); d.classList.contains('hidden')? d.classList.remove('hidden'): d.classList.add('hidden');"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(` Choose Subject <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" fill="none" viewBox="0 0 10 6"${_scopeId}><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"${_scopeId}></path></svg>`);
      } else {
        return [
          createTextVNode(" Choose Subject "),
          (openBlock(), createBlock("svg", {
            class: "w-2.5 h-2.5 ms-3",
            "aria-hidden": "true",
            fill: "none",
            viewBox: "0 0 10 6"
          }, [
            createVNode("path", {
              stroke: "currentColor",
              "stroke-linecap": "round",
              "stroke-linejoin": "round",
              "stroke-width": "2",
              d: "m1 1 4 4 4-4"
            })
          ]))
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`<div id="dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow dropdown-content w-44 dark:bg-gray-700"><ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefaultButton"><li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" onclick="document.getElementById(&#39;dropdown&#39;).classList.add(&#39;hidden&#39;);"> Math </li><li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" onclick="document.getElementById(&#39;dropdown&#39;).classList.add(&#39;hidden&#39;);"> Science </li><li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" onclick="document.getElementById(&#39;dropdown&#39;).classList.add(&#39;hidden&#39;);"> Language Proficiency </li><li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" onclick="document.getElementById(&#39;dropdown&#39;).classList.add(&#39;hidden&#39;);"> Reading Comprehension </li></ul></div><div><!--[-->`);
  ssrRenderList($data.questions, (vq) => {
    _push(`<ul class="p-2">`);
    _push(ssrRenderComponent(_component_CreateQuestion, {
      id: vq.id,
      question: vq.question,
      options: vq.options,
      correct: vq.correct,
      onUpdate: $options.updateQuestion,
      class: "text-center rounded-md shadow-md bg-sg-white p-7"
    }, null, _parent));
    _push(`</ul>`);
  });
  _push(`<!--]--></div>`);
  _push(ssrRenderComponent(_component_Button, {
    onClick: $options.addQuestion,
    class: "flex justify-center"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Add Question`);
      } else {
        return [
          createTextVNode("Add Question")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(ssrRenderComponent(_component_Button, {
    style: $data.showRemoveButton ? null : { display: "none" },
    onClick: $options.removeQuestion,
    class: "flex justify-center"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Remove Question`);
      } else {
        return [
          createTextVNode("Remove Question")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(ssrRenderComponent(_component_Button, {
    onClick: $options.submitQuestion,
    class: "flex justify-center"
  }, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(`Submit Questions`);
      } else {
        return [
          createTextVNode("Submit Questions")
        ];
      }
    }),
    _: 1
  }, _parent));
  _push(`<div id="incomplete" class="hidden"><div class="flex justify-center border-2 bg-sg-white border-sg-red"> Make sure all inputs are complete before submitting or click Remove Questions </div></div></div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/upload/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { index as default };
//# sourceMappingURL=index-c4dcf2b5.mjs.map
