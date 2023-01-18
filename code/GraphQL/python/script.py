import requests
import json

url = 'https://ncatsidg-dev.appspot.com/graphql'

def postGraphQLQuery(query, variables):
    response = requests.post(url, json={'query': query , 'variables': variables})
    if response.status_code == 200:
        return json.loads(response.text)['data']
    else:
        print("Error running query")
        print(query)


targetQuery = """
    query targetDetails($sym: String) {
        target(q:{sym:$sym}) {
            name
            tdl
            fam
            sym
            description
            novelty
        }
    }"""

listQuery = """
    query targetDetails($targets: [String]){
          targets(targets: $targets) {
            count
            targets {
              name
              tdl
              fam
              sym
              description
              novelty
            }
          }
        }
    """

geneList = ["ACE2", "DRD2", "CAMK2A", "MAPK1"]

# query targets one at a time
for sym in geneList:
    data = postGraphQLQuery(targetQuery, {'sym': sym})
    print(data)

# it's better to query them all at once like this
data = postGraphQLQuery(listQuery, {'targets': geneList})
print(data)