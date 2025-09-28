---
title: "Data Test"
date: 2025-09-22
---

# Data Test

## Writing Data Test
{{ if .Site.Data.writing }}
Writing data exists!
{{ if .Site.Data.writing.api_articles }}
API articles count: {{ len .Site.Data.writing.api_articles }}
{{ else }}
No API articles found
{{ end }}
{{ else }}
No writing data found
{{ end }}

## Featured Data Test
{{ if .Site.Data.featured }}
Featured data exists!
{{ if .Site.Data.featured.technology }}
Technology count: {{ len .Site.Data.featured.technology }}
{{ else }}
No technology found
{{ end }}
{{ else }}
No featured data found
{{ end }}
