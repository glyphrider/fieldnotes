# Field Notes

A simple web page that displays a daily field guide image based on the current date.

## Adding Images

Images live in the `images/` directory and are named by month and day: `MMDD.png` (e.g., `0412.png` for April 12). Add a PNG for each day you want to display.

## Local Testing

Requires [Podman](https://podman.io/) (or substitute Docker by editing the Makefile).

```bash
make test       # serves the site at http://localhost:8080
make stop_test  # stop the server
```

## Deployment

Requires the [AWS CLI](https://aws.amazon.com/cli/) configured with access to the S3 bucket.

```bash
make upload
```

To override the bucket or set a cache TTL:

```bash
BUCKET=my-bucket-name MAX_AGE=86400 make upload
```

The default bucket is set at the top of the Makefile.
