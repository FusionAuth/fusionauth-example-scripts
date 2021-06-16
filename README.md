## User Searching

FusionAuth user search has some limits. See https://fusionauth.io/docs/v1/tech/reference/limitations/#user-searches for the current limitations.

This project contains some helpful scripts to work around these limits and allow you to download all your users.

This iterates the users with an email prefix of `a-z` or `0-9`. (Elasticsearch is case insensitive.) If there are more than 10000 results for any segment, it uses a second set of prefixes: `aa`, `ab`, `ac` and so on.

If you need to search usernames or have so many users that you need to do a third letter on the prefix, you'll have to modify the script.

## Prerequisites

* bash
* jq https://stedolan.github.io/jq/download/
* an API key that can hit the `/api/user/search` endpoint
* using FusionAuth with the Elasticsearch search engine

## Usage

```
./fullusersearch.sh
```

All users will be in `users.json` in an array with the key `users`.
