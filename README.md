# Description

Site is now live here: https://lswa-writing-contest.herokuapp.com/

This is a streamlined version of the LSWA Sports Writing Contest. Each year, the Louisiana Sports Writers Association has had its members comb through articles and newspapers to find their best stories and submit them for each year's contest.
Through this new web app, members will be able to easily submit their articles, keep track of their submissions, edit them or delete them. Judges will have access to submissions, which are tagged with the requisite category number for each competition.

--Watch this video to see how it works!--
https://youtu.be/zJMfMukpXjw
--Blog post --
https://johnjamesmarshalljr.medium.com/sinatra-project-5c056f333eeb

## Built With

Ruby 2.5.5
Sinatra and Active Record - Ruby frameworks used
SQLITE3 - Relational databases used for development
HTML5 & CSS

## Usage

This app is hosted on Heroku: https://lswa-writing-contest.herokuapp.com/
App might take time to load sometimes. The reason is that heroku puts apps which are on free plan to sleep after 30 minutes of inactivity. So when you visit the website, the app is waked from sleep which takes a little time!

##development
Try this app in your local environment, clone and run the following command inside this project's directory

$ bundle
Start up local server
$ bundle exec shotgun
For interactive console
$ bundle exec tux

#Future improvements
-Add "judges" class to give access to submissions to be judged
-Add submissions sections for .PDF files and photos

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
