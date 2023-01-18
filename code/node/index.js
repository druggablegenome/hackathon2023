const request = require('then-request');

const url = 'https://ncatsidg-dev.appspot.com/graphql'
const runGraphQLquery = (query, variables) => {
    return request('POST', url, {json: {query: query, variables: variables}})
        .then((res) => {
        if (res.statusCode == 200) {
            const rawData = JSON.parse(res.body.toString());
            if (rawData && rawData.data) {
                return rawData.data
            }
            return rawData;
        } else {
            console.error(`Error running query`);
            console.error(query);
        }
    });
}

function queryOneTarget(sym) {
    return `
        query targetDetails{
          target(q:{sym:"${sym}"}) {
            name
            tdl
            fam
            sym
            description
            novelty
          }
        }`;
}

function queryTargetList() {
    return `
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
        }`;
}

const geneList = ["ACE2", "DRD2", "CAMK2A", "MAPK1"]

// query one at a time
geneList.forEach((sym) => {
    const symbolQuery = queryOneTarget(sym);
    runGraphQLquery(symbolQuery).then((res) => {
        console.log(res);
    });
});

// query all at once -- better
const listQuery = queryTargetList()
runGraphQLquery(listQuery, {targets: geneList}).then((res) => {
    console.log(res);
})

