# Doctorize API
Medical Specialists/Doctors appointment 

<!--- These are examples. See https://shields.io for others or to customize this set of shields. You might want to include dependencies, project status and licence info here --->
![GitHub repo size](https://img.shields.io/github/repo-size/edemagbenyo/doctorize-api)
![GitHub contributors](https://img.shields.io/github/contributors/edemagbenyo/doctorize-api)
![GitHub stars](https://img.shields.io/github/stars/edemagbenyo/doctorize-api?style=social)
![GitHub forks](https://img.shields.io/github/forks/edemagbenyo/doctorize-api?style=social)
![Twitter Follow](https://img.shields.io/twitter/follow/edemagbenyo?style=social)


<!-- Project details -->

Doctorize API is the backend powering [Doctorize](https://doctorize.herokuapp.com/) platform. This API is built using Rails API, PostgreSQL as the DB engine. Testing is done with RSpec and Shoulda matchers. The API makes use of JWT token to implement authentication and authorization.

[Live version](https://doctorize.herokuapp.com/)
To report a bug or request a feature use this [link](https://github.com/edemagbenyo/doctorize-api/issues)

![Screenshot of the webpage](https://github.com/edemagbenyo/doctorize-api/blob/implement-backend/public/overview.gif)

## About the project
Doctorize is platform for medical appointment with specialists and GP doctors. Patients from the comfort of their home make appointment with doctors to get medical and professional advices on health issues. It is a full stack mobile responsive application built with React for the frontend and a Ruby on Rails API backend.



### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [JWT](https://jwt.io/)
* [RSpec](https://rspec.info/)



## Getting started

To get this project running on your local machine, follow these steps

### Prerequisites

Before you begin, ensure you have met the following requirements:
<!--- These are just example requirements. Add, duplicate or remove as required --->
* You have a `<Windows/Linux/Mac>` machine.
* `ruby '2.6.3`
* `rails 6.0.2`



## Installing Doctorize

To install Doctorize, follow these steps:

1. Clone the project
```
git clone git@github.com:edemagbenyo/doctorize-api.git

cd doctorize-api
```
2. Install the gems
```
bundle install
```
3. Database creation, migration and seeding it
```
rails db:create db:migrate db:seed
```
4. Start the API development server on **port:3001**
```
rails servers -p 3001
```
5. Run all test
```
bundle exec rspec
```

## Contributing to Doctorize
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to the Doctorize, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b feature/awesome_branch`.
3. Make your changes and commit them: `git commit -m 'awesome message'`
4. Push to the original branch: `git push origin feature/awesome_branch`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Thanks to the following people who have contributed to this project:

* [@edemagbenyo](https://github.com/edemagbenyo) 📖



## Contact

If you want to contact me you can reach me at <edem.agbenyo@gmail.com>.

## License
<!--- If you're not sure which open license to use see https://choosealicense.com/--->

This project uses the following license: [MIT](<link>).
