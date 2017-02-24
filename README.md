# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Rails version: 5.0.0.1

Ruby version: 2.3.1 (i686-linux)

RESTful API to index a page's content.


API 1: To Fetch and store H1, H2, H3 and Links from url.

Path: http://localhost:3000/api/v1/web_url

Api tools: Postman 
Collection_link: https://www.getpostman.com/collections/5ece13bb3a2d3aec01ee

Method: Post  

Header: content_type:application/json

Body:
{
	web_url[url]: "http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails"
}

Response:

[
  {
    "url": [
      "http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails",
      {
        "link_contents": [
          "https://cdn.sstatic.net/Sites/stackoverflow/img/favicon.ico?v=4f32ecc8f43d",
          "https://cdn.sstatic.net/Sites/stackoverflow/img/apple-touch-icon.png?v=c78bd457575a",
          "/opensearch.xml",
          "http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails",
          "https://cdn.sstatic.net/Sites/stackoverflow/all.css?v=8a0d43abe287",
          "/feeds/question/1177863"
        ]
      },
      {
        "h1_contents": []
      },
      {
        "h2_contents": [
          " 2 Answers ",
          "Your Answer",
          " Not the answer you're looking for? Browse other questions tagged ",
          " or ",
          ". "
        ]
      },
      {
        "link_contents": [
          " your communities ",
          "Sign up or ",
          "Post as a guest"
        ]
      }
    ]
  }
]

API 2: Fetch all data.

Path: http://localhost:3000/api/v1/web_url

Method: get

Response:

[
  {
    "url_0": [
      "http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails",
      {
        "link_contents": [
          "https://cdn.sstatic.net/Sites/stackoverflow/img/favicon.ico?v=4f32ecc8f43d",
          "https://cdn.sstatic.net/Sites/stackoverflow/img/apple-touch-icon.png?v=c78bd457575a",
          "/opensearch.xml",
          "http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails",
          "https://cdn.sstatic.net/Sites/stackoverflow/all.css?v=8a0d43abe287",
          "/feeds/question/1177863"
        ]
      },
      {
        "h1_contents": []
      },
      {
        "h2_contents": [
          " 2 Answers ",
          "Your Answer",
          " Not the answer you're looking for? Browse other questions tagged ",
          " or ",
          ". "
        ]
      },
      {
        "h3_contents": [
          " your communities ",
          "Sign up or ",
          "Post as a guest"
        ]
      }
    ]
  }
]