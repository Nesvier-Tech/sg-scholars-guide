import { Client, Databases, ID, Query } from 'appwrite';

// TEST PROJECT
// const PROJECT_ID = '6551f0f5e59cbbe16389';
// const DATABASE_ID = '6551f11f78036659169c';
// const COLLECTION_ID = '65678a200361fbaf0193';

// Scholar's Guide
const PROJECT_ID: string = '652bbefc35c78d6b21ed';              // SG: Scholar's Guide
const DATABASE_ID: string = '65697a59b90e048cd714';             // SGDB
const MATH_COLLECTION_ID: string = '65697cc59e598b1d3d11';      // Math Collection
const SCI_COLLECTION_ID: string = '65697caf0507daf45601';       // Science Collection
const LANG_PROF_COLLECTION_ID: string = '65697ddbb37b244a5c56'; // Language Proficiency Collection
const READ_COMP_COLLECTION_ID: string = '65697e2043358985efbb'; // Reading Comprehension Collection

/////// Client ///////
const client = new Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject(`${PROJECT_ID}`);

/////// Database ///////
const databases = new Databases(client);

// List of subjects to choose when querying
export const SUBJECTS: {MATH: string, SCI: string, LANG_PROF: string, READ_COMP: string} = {                               // Leaky
    MATH: MATH_COLLECTION_ID,
    SCI: SCI_COLLECTION_ID,
    LANG_PROF: LANG_PROF_COLLECTION_ID,
    READ_COMP: READ_COMP_COLLECTION_ID
}

// Create Documents (Row)
export function post_questions(SUBJECT: string, questions: any) {
    for (const q of questions) {
        if (q.question === '' || q.options.length === 0) return -1;

        const promise = databases.createDocument(
            `${DATABASE_ID}`,   // Database ID
            `${SUBJECT}`,       // Collection ID
            ID.unique(),
            {
                'questionID': q.id + 1,         // Change in the future
                'question': q.question,
                'correctAnswer': q.correct,
                'wrongAnswers': q.options
            }
        ); const ret = executeQuery(promise);

        if ('code' in ret) return -1; // Error
    }
    return 0;
}


// Queries function here: https://appwrite.io/docs/products/databases/queries
// List Documents
export async function get_questions(SUBJECT: string) {
    let promise = databases.listDocuments(
        `${DATABASE_ID}`,    // Database ID
        `${SUBJECT}`,  // Collection ID
        [
            Query.select(['questionID', 'question', 'correctAnswer', 'wrongAnswers'])
        ]
    ); 
    const result = await executeQuery(promise);
    //console.log(`Result: ${result}`);
    return result;
}

export const SGDB = () => {
    return {
        SUBJECTS,
        post_questions,
        get_questions
    }
}

function executeQuery(promise: Promise<any>) {
    return promise.then(function (response) {
        //console.log(`Response: ${response}`);
        return response;
    }, function (error) {
        //console.log(error);
        return error;
    });
}

// For future use
// We can use getLastID() and have the question 0 to get the last id
// for uploading the questions
// or we can change the function to give us n number of available ids
function getLastID(SUBJECT: string) {
    return 0;
    let promise = databases.listDocuments(
        `${DATABASE_ID}`,    // Database ID
        `${SUBJECT}`,  // Collection ID
        [
            Query.select(['questionID']),
        ]
    );
}