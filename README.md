# Trailers_app

![açılış ekranı](https://user-images.githubusercontent.com/95585412/206760899-e4c35e04-14b3-465c-a020-8799b111993e.gif)

We have different app icon its show when you open your app.
After that a splashscreen animation plays with sound effect.

#Splashscreen animation 
For animation used library: lottie 2.0.0
For animation asset : https://lottiefiles.com used.

#SplashScreen sound effect
For sound effect used library: just_audio 0.9.30

#For stay logged in
After Splash screen ends its navigate to login_logic page which will decide either user already logged in or not,
if user logged in it will navigate to MainScreen if user not logged in it will navigate to LoginScreen for this logic i used library:flutter_secure_storage 7.0.0 our loginpage have Firebase authentication with help of flutter_secure_storage library we get users uid key and store it and check if  upcoming uid key is null or match with current users uid.
![LoginScreen](https://user-images.githubusercontent.com/95585412/206760205-ee81ced1-2115-4141-927c-3e772e33045a.png)

#RegisterPage
  If user dont have and account there is a text button in login page to navigate to register page.
  In register page we have flutter_pw_validator 1.5.0 library to validate our user information as we like.
  when validation not match we show error with snackbar if its match the credential we also show snackbar for success.
  On succesfull registeration our register page automaticly navigate to the loginpage with snackbar at bottom says "account created succesfully".
  ![RegisterScreen](https://user-images.githubusercontent.com/95585412/206760246-b999ce80-3c7c-40bd-9992-9ec47452b0fd.png)
![RegisterScreen1](https://user-images.githubusercontent.com/95585412/206760254-116befa4-beaf-4ea8-ba93-af76caf74621.png)
![RegisterScreen2](https://user-images.githubusercontent.com/95585412/206760264-3558ec95-82fe-40ea-ab84-377466a10cfb.png)
![RegisterScreen3](https://user-images.githubusercontent.com/95585412/206760275-a6fe777a-069f-4a7f-b816-1026ec6196a8.png)


#HomeScreen
In main screen at top we have default initial Trailer image on clicking info it show a dialog which contains story of the movie.
When u click Play it navigate to the videodetailpage.
Bottom of the initial trailer image we have categories and movie pictures when we click one of them screen automaticly scrool to the top and initial image change also story inside info button change as well.
bottom of the screen there 3 buttons LogOut-Home-Search
If we dont want to logged in or see loginpage everytime we can logout with Logout button which is connected to the firebase.logout code.
Home button re navigate to Homescreen Search button navigate to search screen.
![MainScreen](https://user-images.githubusercontent.com/95585412/206760314-6d55d21e-0d5f-498a-8b55-fd71c4703bbf.png)
![MainScreen1](https://user-images.githubusercontent.com/95585412/206760334-e837dfcf-433f-4833-8faf-6490dfe18936.png)
![MainScreen2](https://user-images.githubusercontent.com/95585412/206760345-8778cc46-6af9-441b-a4ad-0b27c9b5809c.png)
![MainScreen3](https://user-images.githubusercontent.com/95585412/206760362-66fa9055-2cab-47e3-a884-574838c2ad13.png)
![MainScreen4](https://user-images.githubusercontent.com/95585412/206760371-8ff193ac-6330-42b7-86b4-f3880966e8fb.png)

#MovieDetailPage
top of the screen we have video player which i used video_player 2.4.9 library.
Bottom of the videoplayer we have image of the movie we selected and under that story of the movie.
![PlayScreen](https://user-images.githubusercontent.com/95585412/206760414-f19372f4-0f04-4375-9c8f-57b2296659da.png)
![PlayScreen1](https://user-images.githubusercontent.com/95585412/206760418-1262cbce-5583-4773-9714-67099d19235a.png)

#SearchPage
Which is basicly a search page when you click one of the movie its navigate to moviedetailpage of that movie.
![SearchScreen](https://user-images.githubusercontent.com/95585412/206760447-81a682f9-abf7-4175-8d9f-43d4c6b18131.png)
![SearchScreen1](https://user-images.githubusercontent.com/95585412/206760461-20fab683-d197-4ee2-b9da-6aca8c403c74.png)
![SearchScreen2](https://user-images.githubusercontent.com/95585412/206760470-1252911f-7e4b-4ca8-9cfe-4f2a6579d904.png)
![SearchScreen3](https://user-images.githubusercontent.com/95585412/206760481-2816bdf3-d62f-4cb1-800e-d78eacdaadb2.png)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
