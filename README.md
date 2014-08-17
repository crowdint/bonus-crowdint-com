# Bonus.crowdint.com

## Development

You'll need to create a Google App and get an OAuth token.
1. Go to https://console.developers.google.com/project
2. Create a new project
3. Enable the Google Contacts and Google+ API
4. Go to API > Credentials and create a new Client ID for a Web Application
5. Write the App ID and secret on `config/application.yml`

Should look something like this:

    GOOGLE_APP_ID: "APP_ID"
    GOOGLE_APP_SECRET: "APP_SECRET"

