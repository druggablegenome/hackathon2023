## getting data out of Pharos
* There are three main use cases for downloading data from TCRD/Pharos
  * If you need lots and lots of the data, you'll probably want to download a complete dump of TCRD at : http://juniper.health.unm.edu/tcrd/download/
  * If you need only a focused dataset, you should probably just download a CSV from the Pharos UI. Every List and Details page 
  has a link to download data, where you can select what data you want.
  * If you're writing a script, you probably want to query the GraphQL database. You'll find code to get you started here in this repo.

### Querying the GraphQL database
* GraphQL Urls. If the DEV instance works for your purposes, try and use that one.
  * DEV - https://ncatsidg-dev.appspot.com/graphql
  * PROD - https://pharos-api.ncats.io/graphql
* GraphQL Query starting points
  * Pharos' API page has some useful starting points for your queries
  * All the data that is visible on Pharos comes through the graphQL API, so if you see data on a page that you want, 
  you can use the Network panel of your browser Dev tools to see the query that Pharos is using to fetch that data, and use 
  it as a starting point for your own query
* General Workflow
  * Navigate to the above GraphQL API with your browser. 
  * Develop your GraphQL query, using the sandbox & documentation available there.
  * Copy the query into your script.
* Tips
  * Fewer calls is better, i.e. call endpoints with a list of targets, rather than looping through calling them one at a time
* Starter code
  * Nodejs (https://nodejs.org/en/download/)
    * navigate to the 'node' subfolder
    * run ```npm install``` to install dependencies
    * call ```node index.js```
    * modify code to suit your needs
  * Python
    * navigate to the 'python' subfolder'
    * call ```python script.py```
    * modify code to suit your needs
  * Ask us for your language of choice, and we can try to get it added to this


## getting data back into Pharos
* see https://github.com/ncats/pharos-community-data-api for a tutorial on creating an API that can be used to 
show your data in Pharos.