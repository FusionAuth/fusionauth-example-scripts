# Get all the users

FusionAuth user search has some limits. See https://fusionauth.io/docs/v1/tech/reference/limitations/#user-searches for the current limitations.

This project contains helpful scripts to work around these limits and allow you to download all your users.

The `fulluserdownload.sh` script iterates the users with an email prefix of `a-z` or `0-9`. (Elasticsearch is case insensitive.) If there are more than 10000 results for any segment, it uses a second set of prefixes: `aa`, `ab`, `ac` and so on.

If you need to search usernames or have so many users that you need to do a third letter on the prefix, you'll have to modify the script.

## Prerequisites

* bash
* curl
* jq https://stedolan.github.io/jq/download/
* an API key that can hit the `/api/user/search` endpoint
* using FusionAuth with the Elasticsearch search engine

## Setup

Update `fulluserdownload.sh` with your API key and your FusionAuth instance hostname.


## Usage

```
./fulluserdownload.sh
```

All users will be in a `users.json` file. They will be in an array with the key `users`.

## Learn more

Learn more about FusionAuth: https://fusionauth.io
