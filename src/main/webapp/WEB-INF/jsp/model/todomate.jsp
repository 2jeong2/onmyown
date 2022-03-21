<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="description" content="What will you do today?"/>
    <link rel="shortcut icon" type="image/png" href="favicon.png"/>
    <title>todo mate</title>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-functions.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-database.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-storage.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-analytics.js"></script>
    <script type="text/javascript" src="//wurfl.io/wurfl.js"></script>
    <style>
      .center-screen {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        min-height: 100vh;
      }
    </style>
  </head>
  <body>
    <div class="center-screen" id="logoImage">
      <img src="applogo100.png" />
    </div>
    <script>
      if (WURFL.is_mobile === true) {
        var userAgent = navigator.userAgent || navigator.vendor || window.opera;
        var isiOS = [
          'iPad Simulator',
          'iPhone Simulator',
          'iPod Simulator',
          'iPad',
          'iPhone',
          'iPod'
        ].includes(navigator.platform) || (navigator.userAgent.includes("Mac") && "ontouchend" in document)

        if (isiOS) {
          window.location.href = "https://apps.apple.com/us/app/id1505220130";
        } else {
          window.location.href = "https://play.google.com/store/apps/details?id=com.undefined.mate";
        }
      } else {
        var logoImage = document.getElementById("logoImage");
        logoImage.parentNode.removeChild(logoImage);

        var firebaseConfig = {
          apiKey: "AIzaSyCtSjt1LBEXmQnZdjD8DOPXBc5I1acm0Ew",
          authDomain: "mate-914f3.firebaseapp.com",
          databaseURL: "https://mate-914f3.firebaseio.com",
          projectId: "mate-914f3",
          storageBucket: "mate-914f3.appspot.com",
          messagingSenderId: "274121826895",
          appId: "1:274121826895:web:b05334cd15db33ac21803a",
          measurementId: "G-E79F8FYYM6"
        };
        firebase.initializeApp(firebaseConfig);

        var script = document.createElement('script');
        script.type = "application/javascript";
        script.src = "main.dart.js";
        document.body.appendChild(script);
      }
    </script>
  </body>
</html>
