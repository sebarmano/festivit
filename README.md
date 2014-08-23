# festivit

We at festivit believe in collaboration and charity. 
Our platform automates complex festival logistics for nonprofits so more time can be spent on the important stuff.

In this first release, festivit main objective was to solve 4 specific pain
point of the Shakori Hills festival organization: outdated application
processes, slow application review, data stored in multiple locations and paper
based event check-in.

## About the code
festivit was born as the final project for TIY course in Durham, in August 2014.
The app was created in Ruby on Rails framework, and also Bourbon, Neat,
Javascript among other technologies were used.

## Installation and usage

This application uses Postgres, so you will need it installed on your machine.
If on Linux, use your package manager.
On OS X, if you have Homebrew, run `brew install postgresql`.

Once you have Postgres installed, edit `config/database.yml` -- or set up
Postgres to have a database called 
`freeshelf_development` for your current user.

Next, install all required gems:

```sh
bundle install
```

Finally, set up the database:

```sh
rake db:create db:migrate db:seed
```

## About the team
festivit team is composed of seven developers, five of them in charge of the back
end code and two in charge of the front end and design. 

- Mae Beale: Back end developer / Team lead.
- David Marshall: Back end developer.
- Scott Bradshaw: Back end developer.
- Jeremy Ward: Back end developer.
- Sebastian Armano: Back end developer.
- Talal Obeid: Front end developer.
- Justin Parker: Front end developer.

## Contributing

If you are new to using git and GitHub, follow these directions:

1. Fork the project.
2. Clone _your_ copy.
3. Add another remote:  
   `git remote add upstream
https://github.com/festivit/festivit.git`
4. Make a local branch for your feature.
5. Write code.
6. Test it out.
7. Run `git fetch upstream` and then `git merge upstream/master` in your branch.
8. Test again.
9. Push your branch to your repo.
10. Make a pull request!

## festivit next steps

Do you have an idea of how festivit (festiv.it) could be of service, or want to
join the festivit team? Talk to us! We are a community of developers who love to
give back. Our first major event will be a charitable hackathon in fall 2015 to
serve local nonprofits. Let’s make it happen...together.
