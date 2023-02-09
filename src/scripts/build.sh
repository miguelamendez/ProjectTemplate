#!/bin/bash

# Script to generate a project template directory

# Check for command line arguments
if [ $# -lt 1 ]; then
  echo "Usage: $0 project_name [github]"
  exit 1
fi

# Define project name and create project directory
project_name=$1
mkdir $project_name
# Create subdirectories in the project directory
cd $project_name
mkdir src
mkdir src/funcs
mkdir src/scripts
mkdir src/shared
echo "#!/bin/bash

#Here add your dependencies script">src/scripts/dependencies.sh

mkdir data
mkdir data/cred #For credentials
mkdir data/raw
mkdir data/datasets
mkdir data/shared

mkdir analysis
mkdir analysis/report
mkdir analysis/results
mkdir analysis/models

mkdir docs
mkdir docs/research
mkdir docs/research/pdfs
mkdir docs/research/abstracts
mkdir docs/research/bibtexts
mkdir docs/shared

# Create a README file in the project directory
echo "# $project_name" > README.md
echo "Readme file created by $USER using  the project_template script" >> README.md

#License OpenMLLicense to guaranty no funny busines
echo "Copyright $(date) $USER

This project, including all its components such as raw data, images, audio files, code, text, weights, and statistical model implementations, is licensed under the terms of the OpenMLLicense.

The OpenMLLicense grants the user the right to use, modify, and distribute this project, as long as any derivative works (including, but not limited to, machine learning models and other statistical models trained using the contents of this project) are also licensed under the terms of the OpenMLLicense and made available as free and open source software. The structure of the model, including the architecture and its weights, must be fully disclosed and made publicly available. The source code, configuration files, and any other necessary files to build, run, and use the derivative work must also be made publicly available.

Moreover, all data generated by a derivative work created using this project must also be protected by the terms of the Copyleft License, including but not limited to the outputs of the model and any intermediate data created during training.

The creation and distribution of closed-source derivative works is strictly prohibited.

THIS PROJECT AND ANY DERIVATIVE WORKS ARE LICENSED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS PROJECT OR ANY DERIVATIVE WORKS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE." > LICENSE
# All done!
#Create repo
git init .
git add .
git commit -m "Initial commit"
echo "Project $1 directory created successfully."
#Adding to github
if [ $# -lt 2 ]; then
  echo "Only local repo created"
  exit 0
else
  if [ "$2" = "github" ]; then
    sh ../github_repo.sh
  else
    echo "Seems the platform is not supported , only building repo localy"
  fi
fi