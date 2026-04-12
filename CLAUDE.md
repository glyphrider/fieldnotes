# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A static single-page web app ("Field Notes") that displays a daily nature/field guide image based on the current date. On load, it constructs a filename from the current month and day (e.g., `images/0412.png`) and displays it full-width. A "Back" button appears only after the image successfully loads.

## Commands

```bash
# Serve locally via nginx in a container (available at http://localhost:8080)
make test

# Stop the test container
make stop_test

# Deploy to S3
make upload

# Deploy with a custom bucket or cache TTL
BUCKET=my-bucket MAX_AGE=86400 make upload
```

## Architecture

The entire app is `index.html` + `style.css` + `images/MMDD.png` files. There is no build step, no framework, and no dependencies beyond a browser.

- Images are named by date: `images/MMDD.png` (e.g., `0412.png` for April 12)
- The nav button is hidden via `.hidden` CSS class and revealed only on successful image load
- Deployment syncs `.html`, `.css`, and `images/*.png` separately to set correct content-type headers on S3
