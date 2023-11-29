---
title: "{{extra.work-item-title}}"
date: "{{format-date now '%F %R'}}"
tags: [work-item, {{#if extra.application}}{{extra.application}}{{else}}application{{/if}}, project, {{#if extra.state}}{{extra.state}}{{else}}in-development{{/if}}]
work-item: {{extra.work-item}}
install-date: "{{extra.install-date}}"
---

# Description

{{content}}

# Acceptance Criteria

- [ ] TODO

# Installation

{{#if extra.application}}{{extra.application}}{{else}}application{{/if}} ([{{#if extra.work-item}}{{extra.work-item}}{{else}}000000{{/if}}](https://dev.azure.com/jbhunt/EngAndTech/_workitems/edit/{{extra.work-item}}))

## Results

- TODO

# Notes

