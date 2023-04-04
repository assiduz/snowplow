# create service account prior and download the key as json
# command to create base64 file --> base64 file_name
docker run -e GOOGLE_APPLICATION_CREDENTIALS="/snowplow/config/json_key.json" --rm -v $PWD/config:/snowplow/config snowplow/transformer-pubsub:5.3.1 --iglu-config <base64val> --config <base64val>