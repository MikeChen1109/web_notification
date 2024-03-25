importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: 'AIzaSyD0MO0IEQjRG33-Y0RgN3Zm5Zj04-VsNrA',
  appId: '1:949854037254:web:b4e16de06f6909926eea87',
  messagingSenderId: '949854037254',
  projectId: 'apns-f9313',
  authDomain: 'apns-f9313.firebaseapp.com',
  databaseURL: 'https://apns-f9313.firebaseio.com',
  storageBucket: 'apns-f9313.appspot.com',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});