Building an Android app using GitHub Actions and deploying it using the Expo Application Services (EAS) CLI involves several steps. 

EAS CLI simplifies the process of building and deploying Expo apps. Here's an outline of the process:

1. GitHub Repository - 
    Create a GitHub repository for your React Native application if you haven't already.
    Push your React Native codebase, including the app.json configuration file required by EAS.

2. Expo Account - 
    Make sure you have an Expo account and are signed in.

3. GitHub Secrets - 
    In your GitHub repository, go to "Settings" > "Secrets" and add the necessary secrets:
        EAS_BUILD_API_KEY: Your EAS build API key. You can obtain this from your Expo account.

4. GitHub Actions Workflow:
    Create a new workflow file (e.g., .github/workflows/deploy-android.yml) in your repository.