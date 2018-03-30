# README

Index a page
```bash
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{ "data": { "type": "pages", "attributes": { "url": "https://danfeinfotech.com" } } }' http://localhost:3000/api/v1/pages
```

List all the contents:
```bash
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/api/v1/contents"```