import{_ as a,o as t,c as s,a as n,t as o,d as _,F as d,G as i}from"./entry.ce932d71.js";const l={props:{q:Object}},x={class:"w-1/2 p-4 my-5 text-center rounded-md shadow-md bg-sg-white"},u={class:"text-3xl"},h={class:"text-2xl"},m={class:"text-2xl"};function w(r,q,e,g,f,p){return t(),s("div",x,[n("h2",u,"Question: "+o(e.q.question),1),n("h3",h,"Correct Answer: "+o(e.q.correctAnswer||e.q.correct),1),n("h3",m,[_("Wrong Answers: "),(t(!0),s(d,null,i(e.q.wrongAnswers||e.q.options,c=>(t(),s("ul",{key:r.index},o(c),1))),128))])])}const k=a(l,[["render",w]]);export{k as _};
