# Tickup Take Home Assessment

This is a simple python flask webpage that displays -- _Hello, this is the Tickup Interview Assessment_ when ran. 

## Folder Structure

This repository follows the folder structure below: 

````
tickup-takehome-assessment/
|── .github
|   └── workflows
|        └── scan_and_deploy.yml
├── Dockerfile
├── README.md
├── docker-compose.yml
├── monitor.sh
├── pytest.ini
├── tests
│   └── app_test.py
└── webapp
    ├── app.py
    └── requirements.txt
````
### Files and Description

1. Scan_and_deploy.yml : This is a GitHub actions configuration file with two jobs that are run on push to master branch:
   * First job scans code for vulnerabilities using CodeQL. 
   * Second job builds and deploys the application.
2. Dockerfile : Containerizes the application.
3. Docker-compose.yml : orchestrates application's container service(s) and network.
4. Monitor.sh : Monitoring scripts that checks if application's container is running and can be reached via localhost.
5. pytest.ini : Required to specify paths to look in for imports.
6. app_test.py: Unit test for application.
7. app.py: Application code.
8. requirements.txt: Sets requirements to be installed before application can be run. 


## Github Action Workflow

Github action pipeline is set up to trigger on pushing code to the master branch (only branch). After pushing code, this automatically triggers the `codeql-analysis` (code vulnerability scan) job before the `build-and-deploy` job follows. 
Note that the deployment build will not run if the code scan fails. The `build and deploy` job performs the following vital steps: 
- Install code dependencies.
- Run unit test with coverage. 
- Build and run docker image for application. 
- Run monitor.sh script to check if container/application ran successfully. 

From the actions tab on Github, these jobs can be manually triggered under `CICD with CodeQL Pipeline` workflow. 

## Running Application Locally
* Clone repository and note that Application runs on python version 3. 

### Without Containerisation
1. Install dependencies from requirements.txt 

```code
pip install -r webapp/requirements.txt
# some setups use pip3 instead of pip. If both fail, reinstall python.  
```
2. Run application code 

```code
python webapp/app.py
# some setups use python3 instead of python. If both fail, reinstall python.
```
3. Visit http://localhost:3000 to load application. 

4. Run unit test with coverage

```code
pytest --cov=webapp tests/
```

### With Containerisation

#### Prerequisites

Make sure the following are installed on your local machine: 
1. Docker
2. Docker-compose

Run command to build and run container from root directory: 

```code
docker-compose up
```
App will be accessible via http://localhost:3000
