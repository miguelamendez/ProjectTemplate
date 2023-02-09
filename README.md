# ProjectTemplate

Readme file created by miguelamendez

This project is a simple script for creating a project template to promote organization over the project files. The goal is to easily implement a directory tree that can store code, data for processing, and reports, which can be used to display results in various forms of communication media, such as articles, web blog posts, or others. The current implementation is defined for ML projects but can be modified for other types of projects (hopefully arts,sciences,food?,this project was build using itself!).
The current script creates the following directory structure:

project_name/

   |- src/

      |- funcs

      |- scripts

         dependencies.sh

      |- shared

   |- docs/

      |- research

         |- pdfs

         |- abstracts

         |- bibtexts

      |- shared

   |- data/

      |- raw

      |- datasets

      |- shared

   |- analysis/

      |- report

      |- results

      |- models

   README.md

   LICENSE     

The dependencies.sh by defaultis an empty shell script file
The README.md file by default only contains the name of the project and a line which discribes
The LICENSE file by default is the OpenMLLicense.

Currently the script to generate this can be found in:

project_template/

   |- src/

      |- funcs

      |- scripts

         build.sh

Finally the script initializes a git repo.

##Installation
git clone thisrepo!!!

##Running the script
Running the script is as simple as:
cd project_template/src/scripts
sh build.sh project_name [optional:github]
The optional parameter github initializes a github repo  using the script "github_repo.sh" and the "auth" file with your credentials to authomatically create a github repo.
The "github_repo.sh" and "auth" files are in the following path

project_template/
   |- src/

      |- funcs

      |- scripts

         build.sh

	 github_repo.sh

	 auth

Without the "github" parameter the repo will be only initialized in localhost
After this you will have your new repo inside the script folder "this will be fixed" , you can move it somewhere else in you localhost.

