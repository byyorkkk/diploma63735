#!/usr/bin/env bash

set -e
set -x

base_url="https://adhdapi.azurewebsites.net/"
path="/swagger/v1/swagger.json"
output_path="lib/data/api/ad_api.swagger"

curl "$base_url$path" -o "$output_path"
