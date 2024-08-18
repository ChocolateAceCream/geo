---
title: geo
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.23"

---

# geo

Base URLs:

* <a href="http://52.52.54.255:3000">Production: http://52.52.54.255:3000</a>

* <a href="http://localhost:3000">Development: http://localhost:3000</a>

## POST create geo

POST /geolocations

> Body Parameters

```json
{
  "data": {
    "host": "wsas://asd.ca"
  }
}
```

### Params

|Name|Location|Type|Required|Description|
|---|---|---|---|---|
|body|body|object| yes |none|

> Response Examples

> 200 Response

```json
{
    "_id": {
        "$oid": "66c0e08a878f3bca7c230b85"
    },
    "city": "San Jose",
    "connection_type": "tx",
    "continent_code": "NA",
    "continent_name": "North America",
    "country_code": "US",
    "country_name": "United States",
    "created_at": "2024-08-17T17:40:26.868Z",
    "dma": "807",
    "host": "blog.easydelivery.ltd",
    "ip": "52.52.54.255",
    "ip_routing_type": "fixed",
    "latitude": 37.330528259277344,
    "location": {
        "_id": {
            "$oid": "66c0e08a878f3bca7c230b86"
        },
        "calling_code": "1",
        "capital": "Washington D.C.",
        "country_flag": "https://assets.ipstack.com/flags/us.svg",
        "country_flag_emoji": "🇺🇸",
        "country_flag_emoji_unicode": "U+1F1FA U+1F1F8",
        "geoname_id": 5392171,
        "is_eu": false
    },
    "longitude": -121.83822631835938,
    "msa": "41940",
    "radius": "53.27235",
    "region_code": "CA",
    "region_name": "California",
    "type": "ipv4",
    "updated_at": "2024-08-17T17:40:26.868Z",
    "zip": "95122"
}
```


## GET get geo

GET /geolocations

### Params

|Name|Location|Type|Required|Description|
|---|---|---|---|---|
|params|query|string| yes |none|

e.g. if you want to search host google.com
```js
// first wrap in an json object
let params = {
  "host":"google.com"
}
url = actualUrl + '?params=' + encodeURIComponent(JSON.stringify(params))

```
final request should be like
`http://52.52.54.255:3000/geolocations?params=%7B%22host%22%3A%22google.com%22%7D`

> Response Examples

> 200 Response

```json
{
    "_id": {
        "$oid": "66c0e08a878f3bca7c230b85"
    },
    "city": "San Jose",
    "connection_type": "tx",
    "continent_code": "NA",
    "continent_name": "North America",
    "country_code": "US",
    "country_name": "United States",
    "created_at": "2024-08-17T17:40:26.868Z",
    "dma": "807",
    "host": "blog.easydelivery.ltd",
    "ip": "52.52.54.255",
    "ip_routing_type": "fixed",
    "latitude": 37.330528259277344,
    "location": {
        "_id": {
            "$oid": "66c0e08a878f3bca7c230b86"
        },
        "calling_code": "1",
        "capital": "Washington D.C.",
        "country_flag": "https://assets.ipstack.com/flags/us.svg",
        "country_flag_emoji": "🇺🇸",
        "country_flag_emoji_unicode": "U+1F1FA U+1F1F8",
        "geoname_id": 5392171,
        "is_eu": false
    },
    "longitude": -121.83822631835938,
    "msa": "41940",
    "radius": "53.27235",
    "region_code": "CA",
    "region_name": "California",
    "type": "ipv4",
    "updated_at": "2024-08-17T17:40:26.868Z",
    "zip": "95122"
}
```

## DELETE delete geo

DELETE /geolocations

### Params

|Name|Location|Type|Required|Description|
|---|---|---|---|---|
|params|query|string| yes |none|

e.g. if you want to search delete google.com
```js
// first wrap in an json object
let params = {
  "host":"google.com"
}
url = actualUrl + '?params=' + encodeURIComponent(JSON.stringify(params))

```
final request should be like
`http://52.52.54.255:3000/geolocations?params=%7B%22host%22%3A%22google.com%22%7D`

> Response Examples

> 204 Response

### Responses

|HTTP Status Code |Meaning|Description|Data schema|
|---|---|---|---|
|204|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|success|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.3.1)|record not found|Inline|
