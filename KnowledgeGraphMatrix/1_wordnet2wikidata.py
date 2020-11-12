import json
# from urllib.error import HTTPError
from SPARQLWrapper import SPARQLWrapper, JSON

endpoint_url = "https://query.wikidata.org/sparql"

with open('../DataSplit/KGTN/label_idx.json') as f:
    labels = json.load(f)['label_names']

print(len(labels))

mappings = {}

sparql = SPARQLWrapper(endpoint_url,
                       agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36')
def query(label):
    endpoint_url = "https://query.wikidata.org/sparql"
    query_string = '''
    SELECT *
    WHERE {{
    ?item wdt:P2888 <http://wordnet-rdf.princeton.edu/wn30/{}-n>
    }}
    '''
    query_string_formatted = query_string.format(label[1:])
    sparql.setQuery(query_string_formatted)
    sparql.setReturnFormat(JSON)
    # print(query_string_formatted)
    try:
        return sparql.query().convert()["results"]["bindings"][0]['item']['value']
    except:
        return None
     

for label in labels:
    mappings[label] = query(label)
    print('{}:{}'.format(label, mappings[label]))

with open('mappings_wikidata.json', 'w') as fp:
    json.dump(mappings, fp)