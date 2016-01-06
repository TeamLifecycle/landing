# Contributing
- `$ npm install` to install npm dependencies
- `$ bower install` to install bower dependencies

# Running App
- `$ gulp` to build an optimized version of your application in folder dist
- `$ gulp serve` to start BrowserSync server on your source files with live reload
- `$ gulp serve:dist` to start BrowserSync server on your optimized application without live reload
- `$ gulp test` to run your unit tests with Karma
- `$ gulp test:auto` to run your unit tests with Karma in watch mode
- `$ gulp protractor` to launch your e2e tests with Protractor
- `$ gulp protractor:dist` to launch your e2e tests with Protractor on the dist files


# Deploy
- `aws s3 sync . s3://lifecycle.io --delete --exclude ".git" --region=us-east-1` (must configure aws credentials first)


###### Gratzi!
This is was originally generated via https://github.com/Swiip/generator-gulp-angular