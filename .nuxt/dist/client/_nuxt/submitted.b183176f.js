import{a as c,b as l}from"./SGDB.b0cba65b.js";import{_ as d,c as t,G as a,F as u,o as s,a as n,t as r,d as m}from"./entry.ce932d71.js";const p={data:()=>({questions:void 0}),watch:{questions:function(){console.log("CHANGED!")}},created(){c(l().MATH).then(e=>{this.questions=e.documents,console.log(e)})},methods:{}},f={id:"question-box"};function h(e,_,g,w,A,b){return s(!0),t(u,null,a(e.questions,o=>(s(),t("ul",{key:e.index},[n("div",f,[n("h2",null,"Question: "+r(o.question),1),n("h3",null,"Correct Answer: "+r(o.correctAnswer),1),n("h3",null,[m("Wrong Answers: "),(s(!0),t(u,null,a(o.wrongAnswers,i=>(s(),t("ul",{key:e.index},r(i),1))),128))])])]))),128)}const x=d(p,[["render",h]]);export{x as default};
