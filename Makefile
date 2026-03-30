BUCKET ?= bethanysward-fieldnotes-475727583260-us-east-2-an
MAX_AGE ?= 0
TEST_CONTAINER ?= fieldnotes_test

test :
	podman run --name ${TEST_CONTAINER} -d -ti --rm -p 8080:80 -v .:/usr/share/nginx/html nginx:latest

stop_test :
	podman stop ${TEST_CONTAINER}

upload :
	aws s3 sync --exclude '*' --include '*.html' --content-type 'text/html' --cache-control max-age=${MAX_AGE} . s3://${BUCKET}
	aws s3 sync --exclude '*' --include '*.css' --content-type 'text/css' --cache-control max-age=${MAX_AGE} . s3://${BUCKET}
	aws s3 sync --exclude '*' --include 'images/*.png' --content-type 'image/png' --cache-control max-age=${MAX_AGE} . s3://${BUCKET}

