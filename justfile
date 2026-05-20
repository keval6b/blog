dev:
    hugo serve -DF
build:
    rm -rf public
    hugo --gc
deploy: build
    aws s3 sync --delete public s3://661355305324-website
    aws cloudfront create-invalidation --distribution-id EX9M163DAY7S0 --paths "/*" --no-cli-pager
update:
    hugo mod get -u
