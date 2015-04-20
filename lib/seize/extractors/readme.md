HTTP:
  - follow http redirects;
  - run parser when get a 200 response;

Parser:
  DOM:
    - title
    - images
     - evaluate lazy-loaded images (data-src)
     - evaluate background-image css property
     - define a heuristic to sort them (maybe a score based system that runs as fast as possible)

  meta:
    - title
    - description
    - keywords

  open-graph:
    - og:title
    - og:description
    - og:image
    - og:url

  twitter-card:
    - twitter:title
    - twitter:description
    - twitter:image
    - twitter:url

  Precedence:
    - title: [og, twitter, meta, dom]
    - description: [og, twitter, meta]
    - images: [og, twitter, dom]
    - keywords: [meta]
