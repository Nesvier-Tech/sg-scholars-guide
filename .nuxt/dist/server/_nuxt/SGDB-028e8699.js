import { Client, Databases, Query, ID } from "appwrite";
const PROJECT_ID = "652bbefc35c78d6b21ed";
const DATABASE_ID = "65697a59b90e048cd714";
const MATH_COLLECTION_ID = "65697cc59e598b1d3d11";
const SCI_COLLECTION_ID = "65697caf0507daf45601";
const LANG_PROF_COLLECTION_ID = "65697ddbb37b244a5c56";
const READ_COMP_COLLECTION_ID = "65697e2043358985efbb";
const client = new Client().setEndpoint("https://cloud.appwrite.io/v1").setProject(`${PROJECT_ID}`);
function getClient() {
  return client;
}
const databases = new Databases(client);
const SUBJECTS = {
  // Leaky
  MATH: MATH_COLLECTION_ID,
  SCI: SCI_COLLECTION_ID,
  LANG_PROF: LANG_PROF_COLLECTION_ID,
  READ_COMP: READ_COMP_COLLECTION_ID
};
function getSubjects() {
  return SUBJECTS;
}
function post_questions(SUBJECT, questions) {
  console.log(`SUBJECT: ${SUBJECT}`);
  console.log(`Questions: ${questions}`);
  for (const q of questions) {
    if (q.question === "" || q.options.length === 0)
      return -1;
    const promise = databases.createDocument(
      `${DATABASE_ID}`,
      // Database ID
      `${SUBJECT}`,
      // Collection ID
      ID.unique(),
      {
        "questionID": q.id + 1,
        // Change in the future
        "question": q.question,
        "correctAnswer": q.correct,
        "wrongAnswers": q.options,
        "authorID": q.authorID
      }
    );
    const ret = executeQuery(promise);
    if ("code" in ret)
      return -1;
  }
  return 0;
}
async function get_questions(SUBJECT) {
  let promise = databases.listDocuments(
    `${DATABASE_ID}`,
    // Database ID
    `${SUBJECT}`,
    // Collection ID
    [
      Query.select(["questionID", "question", "correctAnswer", "wrongAnswers"])
    ]
  );
  const result = await executeQuery(promise);
  return result;
}
const SGDB = () => {
  return {
    SUBJECTS,
    post_questions,
    get_questions
  };
};
function executeQuery(promise) {
  return promise.then(function(response) {
    return response;
  }, function(error) {
    return error;
  });
}
export {
  SGDB as S,
  get_questions as a,
  getSubjects as b,
  getClient as g
};
//# sourceMappingURL=SGDB-028e8699.js.map
