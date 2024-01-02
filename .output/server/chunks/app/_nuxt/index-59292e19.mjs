import { useSSRContext, mergeProps, unref, ref, toRef, isRef } from 'vue';
import { _ as _export_sfc, u as useNuxtApp } from '../server.mjs';
import { ssrRenderAttrs, ssrRenderStyle, ssrRenderComponent, ssrRenderList, ssrInterpolate, ssrRenderClass } from 'vue/server-renderer';
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

const useStateKeyPrefix = "$s";
function useState(...args) {
  const autoKey = typeof args[args.length - 1] === "string" ? args.pop() : void 0;
  if (typeof args[0] !== "string") {
    args.unshift(autoKey);
  }
  const [_key, init] = args;
  if (!_key || typeof _key !== "string") {
    throw new TypeError("[nuxt] [useState] key must be a string: " + _key);
  }
  if (init !== void 0 && typeof init !== "function") {
    throw new Error("[nuxt] [useState] init must be a function: " + init);
  }
  const key = useStateKeyPrefix + _key;
  const nuxt = useNuxtApp();
  const state = toRef(nuxt.payload.state, key);
  if (state.value === void 0 && init) {
    const initialValue = init();
    if (isRef(initialValue)) {
      nuxt.payload.state[key] = initialValue;
      return initialValue;
    }
    state.value = initialValue;
  }
  return state;
}
const useFinished = () => useState("finished", () => false);
const usePoints = () => useState("points", () => [0, 0, 0]);
const _sfc_main$3 = {
  __name: "QuizScore",
  __ssrInlineRender: true,
  setup(__props) {
    const finished = useFinished();
    const points = usePoints();
    function computeScore() {
      let score = 0;
      for (const point of points.value) {
        score += point;
      }
      return score;
    }
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<!--[-->`);
      if (unref(finished)) {
        _push(`<div class="quiz-score" style="${ssrRenderStyle({ "margin-top": "0" })}" data-v-9c201ecb><p data-v-9c201ecb>Score</p><p data-v-9c201ecb>${ssrInterpolate(computeScore())}/3</p></div>`);
      } else {
        _push(`<!---->`);
      }
      if (!unref(finished)) {
        _push(`<div class="quiz-score" style="${ssrRenderStyle({ "margin-top": "0" })}" data-v-9c201ecb><p data-v-9c201ecb>Science</p></div>`);
      } else {
        _push(`<!---->`);
      }
      _push(`<!--]-->`);
    };
  }
};
const _sfc_setup$3 = _sfc_main$3.setup;
_sfc_main$3.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/QuizScore.vue");
  return _sfc_setup$3 ? _sfc_setup$3(props, ctx) : void 0;
};
const __nuxt_component_0 = /* @__PURE__ */ _export_sfc(_sfc_main$3, [["__scopeId", "data-v-9c201ecb"]]);
const _sfc_main$2 = {
  __name: "QuestionCard",
  __ssrInlineRender: true,
  props: ["question"],
  setup(__props) {
    const { question } = __props;
    let answerChoice = ref("");
    const finished = useFinished();
    usePoints();
    function isCorrect(letter) {
      if (answerChoice.value == question.answer && letter == question.answer && finished.value == true) {
        return true;
      }
      return false;
    }
    function isIncorrect(letter) {
      if (answerChoice.value == letter && letter != question.answer && finished.value == true) {
        return true;
      }
      return false;
    }
    function isRedOutline(letter) {
      if (answerChoice.value != letter && answerChoice.value != question.answer && letter != question.answer && finished.value == true) {
        return true;
      }
      return false;
    }
    function isRightAnswer(letter) {
      if (answerChoice.value != letter && letter == question.answer && finished.value == true) {
        return true;
      }
      return false;
    }
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "question-card" }, _attrs))} data-v-bb4ec4b0><p style="${ssrRenderStyle({ "margin-top": "1rem", "font-weight": "600" })}" data-v-bb4ec4b0>${ssrInterpolate(__props.question.title)}</p><p style="${ssrRenderStyle({ "margin-bottom": "2rem" })}" data-v-bb4ec4b0>${ssrInterpolate(__props.question.body)}</p><div class="choice-container" data-v-bb4ec4b0><div class="${ssrRenderClass([{ "choice-button-active": unref(answerChoice) === "A", "choice-button-correct": isCorrect("A"), "choice-button-incorrect": isIncorrect("A"), "choice-button-red-outline": isRedOutline("A"), "choice-button": isRightAnswer("A") }, "choice-button"])}" data-v-bb4ec4b0> A. ${ssrInterpolate(__props.question.choices[0])}</div><div class="${ssrRenderClass([{ "choice-button-active": unref(answerChoice) === "B", "choice-button-correct": isCorrect("B"), "choice-button-incorrect": isIncorrect("B"), "choice-button-red-outline": isRedOutline("B"), "choice-button": isRightAnswer("B") }, "choice-button"])}" data-v-bb4ec4b0> B. ${ssrInterpolate(__props.question.choices[1])}</div><div class="${ssrRenderClass([{ "choice-button-active": unref(answerChoice) === "C", "choice-button-correct": isCorrect("C"), "choice-button-incorrect": isIncorrect("C"), "choice-button-red-outline": isRedOutline("C"), "choice-button": isRightAnswer("C") }, "choice-button"])}" data-v-bb4ec4b0> C. ${ssrInterpolate(__props.question.choices[2])}</div><div class="${ssrRenderClass([{ "choice-button-active": unref(answerChoice) === "D", "choice-button-correct": isCorrect("D"), "choice-button-incorrect": isIncorrect("D"), "choice-button-red-outline": isRedOutline("D"), "choice-button": isRightAnswer("D") }, "choice-button"])}" data-v-bb4ec4b0> D. ${ssrInterpolate(__props.question.choices[3])}</div></div></div>`);
    };
  }
};
const _sfc_setup$2 = _sfc_main$2.setup;
_sfc_main$2.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/QuestionCard.vue");
  return _sfc_setup$2 ? _sfc_setup$2(props, ctx) : void 0;
};
const __nuxt_component_1 = /* @__PURE__ */ _export_sfc(_sfc_main$2, [["__scopeId", "data-v-bb4ec4b0"]]);
const _sfc_main$1 = {
  __name: "FinishButton",
  __ssrInlineRender: true,
  setup(__props) {
    useFinished();
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "finish-button" }, _attrs))} data-v-fa488f91><p data-v-fa488f91>Finish</p></div>`);
    };
  }
};
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/FinishButton.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_2 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["__scopeId", "data-v-fa488f91"]]);
const _sfc_main = {
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    useFinished();
    const questions = [
      { id: 0, title: "Question 1", body: "The layer of gas covering the earth is called:", choices: ["Atmosphere", "Hydrosphere", "Litosphere", "Troposphere"], answer: "A" },
      { id: 1, title: "Question 2", body: "A distance of one mile is about:", choices: ["1 kilometer", "16 kilometers", "160 kilometers", "1.6 kilometers"], answer: "D" },
      { id: 2, title: "Question 3", body: "The largest object in the solar system is:", choices: ["A star", "A planet", "An asteroid", "A meteor"], answer: "A" }
    ];
    return (_ctx, _push, _parent, _attrs) => {
      const _component_QuizScore = __nuxt_component_0;
      const _component_QuestionCard = __nuxt_component_1;
      const _component_FinishButton = __nuxt_component_2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "quiz-body-grid" }, _attrs))} data-v-21d945aa><div style="${ssrRenderStyle({ "padding": "0 1rem" })}" data-v-21d945aa><div class="card-container" style="${ssrRenderStyle({ "margin-top": "0" })}" data-v-21d945aa><p data-v-21d945aa>Marc Peejay Viernes</p><p data-v-21d945aa>Student</p></div></div><div style="${ssrRenderStyle({ "padding": "0 2rem" })}" data-v-21d945aa>`);
      _push(ssrRenderComponent(_component_QuizScore, { style: { "margin-top": "0" } }, null, _parent));
      _push(`<div data-v-21d945aa><!--[-->`);
      ssrRenderList(questions, (q) => {
        _push(`<div data-v-21d945aa>`);
        _push(ssrRenderComponent(_component_QuestionCard, { question: q }, null, _parent));
        _push(`</div>`);
      });
      _push(`<!--]--></div><div class="container-100" data-v-21d945aa>`);
      _push(ssrRenderComponent(_component_FinishButton, null, null, _parent));
      _push(`</div></div><div style="${ssrRenderStyle({ "padding": "0 1rem" })}" data-v-21d945aa><div class="card-container" style="${ssrRenderStyle({ "margin-top": "0" })}" data-v-21d945aa><p data-v-21d945aa>Science</p><p style="${ssrRenderStyle({ "margin-top": "1rem" })}" data-v-21d945aa>Time Left:</p><p data-v-21d945aa>1:00:00</p></div></div></div>`);
    };
  }
};
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/quiz/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["__scopeId", "data-v-21d945aa"]]);

export { index as default };
//# sourceMappingURL=index-59292e19.mjs.map
