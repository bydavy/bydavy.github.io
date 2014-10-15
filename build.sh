docker run --rm \
  -p 4000:4000 \
  --volume="$PWD:/site" \
  -it bretfisher/jekyll-serve \
  $@