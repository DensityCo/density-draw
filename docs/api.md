# API Docs

## Games

### Create a game

POST /api/v1/games

*Response*
```
{
  "id": 8172,
  "code": "ATS1"
}
```

### Join a game

POST /api/v1/games/code

*Request*
```
{
  "code": "ATS1"
}
```

*Response*
```
{
  "id": 8172,
  "code": "ATS1"
}
```

### Start the game

Everybody's in. Let's go!

POST /api/v1/games/:id/start

*Response*
```
{
  "id": 4,
  "code": "QNLD",
  "current_question": null,
  "players": [
    {
      "id": 1,
      "user": {
        "id": 2,
        "name": "Fake",
        "image_url": "example.com/test2",
        "email": "fake123@gmail.com"
      }
    },
    {
      "id": 2,
      "user": {
        "id": 1,
        "name": "Jim",
        "image_url": "example.com/test124",
        "email": "jim@density.io"
      }
    }
  ],
  "questions": [
    {
      "id": 3,
      "prompt": "DPU",
      "image_url": "google.com",
      "answers": [
        {
          "id": 1,
          "guess": "robot",
          "is_correct": null,
          "is_funny": true
        }
      ]
    }
  ]
}
```


## Questions

### Get my question

GET /api/v1/games/481/question
*Response*
```
{
  "id": 1898,
  "game_id": 481,
  "user_id": 42,
  "prompt": "R56",
  "image_url": "image.s3.xyz",
  "answers": [
    {
      "user_id": 3,
      "guess": "Gorilla",
      "is_correct": true,
      "is_funny": false
    },
    {
      "user_id": 5,
      "guess": "Doggy",
      "is_correct": false,
      "is_funny": true
    }
  ]
}
```


## Images

### Submit Image
PUT /api/v1/questions/:id/image (only one image per question)

*Request*
```
{
  "image_url": "image.s3.xyz"
}
```

*Response*
```
{
  "id": 1898,
  "game_id": 481,
  "user_id": 42,
  "prompt": "R56",
  "image_url": "image.s3.xyz",
  "answers": [
    {
      "user_id": 3,
      "guess": "Gorilla",
      "is_correct": true,
      "is_funny": false
    },
    {
      "user_id": 5,
      "guess": "Doggy",
      "is_correct": false,
      "is_funny": true
    }
  ]
}
```

## Answers

### Submit Answer
POST /api/v1/questions/:id/answers

*Request*
```
{
  "guess": "Gorilla",
}
```

*Response*
```
{
  "question_id": 4,
  "user_id": 1,
  "guess": "Gorilla",
  "is_correct": false,
  "is_funny": false
}
```