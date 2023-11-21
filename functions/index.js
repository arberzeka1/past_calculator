
const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.calculateSum = functions.https.onCall(async (data, context) => {
  const {firstNumber, secondNumber} = data;

  if (!Number.isInteger(firstNumber) || !Number.isInteger(secondNumber)) {
    throw new functions.https.HttpsError("invalid-argument", "must be int");
  }

  const sum = calculateSumInRange(firstNumber, secondNumber);

  await saveToFirestore(firstNumber, secondNumber, sum);

  return {sum};
});
/**
 * Calculate two numbers and store the sum.
 * @param {number} firstNumber The first number.
 * @param {number} secondNumber The second number.
 * @return {number} sum The second number.
 */
function calculateSumInRange(firstNumber, secondNumber) {
  let sum = 0;
  for (let i = Math.min(firstNumber, secondNumber);
    i <= Math.max(firstNumber, secondNumber); i++) {
    sum += i;
  }
  return sum;
}
/**
 * Add two numbers and the sum.
 * @param {number} firstNumber The first number.
 * @param {number} secondNumber The second number.
 * @param {number} sum The sum of the two numbers.
 */
async function saveToFirestore(firstNumber, secondNumber, sum) {
  const firestore = admin.firestore();
  await firestore.collection("histories").add({
    firstNumber,
    secondNumber,
    sum,
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
  });
}

exports.getHistoryData = functions.https.onCall(async (data, context) => {
  try {
    const querySnapshot = await admin.firestore()
        .collection("histories")
        .orderBy("timestamp", "desc")
        .limit(10)
        .get();

    const historiesList = [];
    querySnapshot.forEach((document) => {
      historiesList.push(document.data());
    });

    return historiesList;
  } catch (error) {
    console.error(error);
    throw new functions.https.HttpsError("internal", "Error getting data");
  }
});


