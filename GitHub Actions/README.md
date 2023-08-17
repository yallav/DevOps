
1. Building an Android app using GitHub Actions and deploying it using the Expo Application Services (EAS) CLI involves several steps. 

EAS CLI simplifies the process of building and deploying Expo apps. Here's an outline of the process:

* GitHub Repository - 
    Create a GitHub repository for your React Native application if you haven't already.
    Push your React Native codebase, including the app.json configuration file required by EAS.

* Expo Account - 
    Make sure you have an Expo account and are signed in.

* GitHub Secrets - 
    In your GitHub repository, go to "Settings" > "Secrets" and add the necessary secrets:
        EAS_BUILD_API_KEY: Your EAS build API key. You can obtain this from your Expo account.

* GitHub Actions Workflow:
    Create a new workflow file (e.g., .github/workflows/deploy-android.yml) in your repository.

2. Building an IOS app by using EAS CLI requires below setps to be performed
2.1 Setup Apple developer account - 
2.1.1 Create apple developer account - https://appleid.apple.com/account 
2.1.2 Enroll to Apple Developer Program on apple developer dashboard.
2.1.3 Enrollment can be an individual or an organization. For individual enrollement, it costs USD $99 per year.

2.2 Setup EXPO account - 
2.2.1 Create or Login to Expo Application Services (EAS) account - https://expo.dev/signup / https://expo.dev/login 

2.3 Go to the project and open “app.json” file and provide name, slug and version field values under “expo” section.
2.4 Create EAS configuration file - 
2.4.1 Open the project root folder in command prompt and install eas-cli globally by issuing - npm install -g eas-cli
2.4.2 Login to eas by issuing - eas login (enter eas account user name and password details)
2.4.3 Verify successful login by issuing - eas whoami
2.4.4 Configure the project by issuing - eas build:configure
2.4.5 On successfully configuring the project, we can see eas.json file under the project root folder
2.4.6 Edit the “eas.json” file with the following details under “ios” section
        "ios": {
                "appleId": "<Login Id>",
                "ascAppId": "12345534546",
                "appleTeamId": "<Membership Id>",
            }
        ** ascAppId => Apple ID on app information page from application page**
        ** appleTeamId => Team Id from “Membership” section on apple developer dashboard**

2.5 Build the file by issuing on the local system - eas build --platform ios
NOTE - First time build file will prompt for automatic configurations. This step will help us in taking care lot of things automatically such as generating new apple distribution certificate, apple provisioning profile etc.

2.5.1 While configuring, we can avoid push notification services by entering push notification services as “No”
2.5.2 We can access link which is displayed in command prompt during build configuration process. This link shows us the details of build stage.
2.5.3 Go to Apple Developer Dashboard and click “App Store Connect”
2.5.4 Click “My Apps” on App Store → click “+” blue icon to create new application
2.5.5 Select “ios” check box on “New App” screen, provide required details, select “Full Access” and click create button
2.5.6 Refresh the Apple Developer Dashboard application to see newly created application
2.5.7 Open the newly created application by clicking on it. Provide application screenshots under different devices
2.5.8 Once screenshots got uploaded under different deveces, enter some text inside “Promotional Text” field, “Description” field, “Keywords” field.
2.5.9 Move on to App Review information section on the application page, provide contact information, uncheck sign-in required field (***only if application doesn’t need sign-up and sign-in functionalities)
2.5.10 Later, go to Version section on the same page and make necessary modifications.
2.5.11 Click “Save” button on top of the page on the right corner side.
2.5.12 On the left pane of the page, click on “General” → “App Information” section. Provide the details of “Category”, “Content Rights”, and “Age Rating”. Click “Save” button on top of the page on the right corner side.
2.5.13 On the left pane of the page, click on “General” → “Pricing and Avaialability” section. Select “PRICE” as “Free”. 2.2.5.14 Click “Save” button on top of the page on the right corner side.
On the left pane of the page, click on “General” → “App Privacy” section. Click “Get Started” button and provide necessary details. Edit privacy policy and provide privacy policy URL. Click “Publish” button on top of the page on the right corner side.
2.5.15 Open the project root folder in command prompt and submit the build to apple store by issuing - eas submit -p ios --latest
2.5.16 We will be asked to create new key. Please accept it by answering “Yes” and provide Apple login credentials. This will prompt a link which can show us the status of build submission.
2.5.17 Click “Test Flight” menu item on top of the App Store Connect page. We can see newly pushed build on the page. Click “manage” link which is on the build and answer the questionnarie on “Encryption” usage and click “Start Internal Testing” button on pop-up window.
2.5.18 On the left pane of the page, click on “Internal Testing” → “+” blue icon. Click “+” blue icon besider “Tester” on page and add tester details. Tester will get an email to test application. Testing has to be carried by logging into tester apple developer account. privacy policy and provide privacy policy URL. Click “Publish” button on top of the page on the right corner side.
2.5.19 Once testing is completed, click “App Store” menu item on top of the App Store Connect page. Go to “Build” section and upload the newly built file . Click “Save” button on top of the page on the right corner side.
2.6 Click “Add For Review” button on top of the page on the right corner side.
2.7 Click “Submit To App Review” button on top of the page on the right corner side.
