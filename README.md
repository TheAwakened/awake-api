## Awake
To be figured out soon.

## API Endpoint
Below are the detail documentation of each available endpoint. 

### Authenticate
```
POST /api/authenticate
```
**Parameter:**
```
"auth": {
  "username": "username",
  "password": "password"
}
```
**Success Response:**
```
Status Code: 201
"jwt": "......"
```
**Failure Response:**
```
Status Code: 404
```

---

### List User
To list the all users, included with their awakenings record. The `time` of `awakening` is formatted according to ISO 8601, a standardized date format.

```
GET /api/users
```
Success Response:
```
[
  {
    "awakenings": [],
    "id": 5,
    "username": "test"
  },
  {
    "awakenings": [
      {
        "time": "2017-11-14T01:27:39.339Z"
      },
      {
        "time": "2017-11-14T01:37:11.666Z"
      }
    ],
    "id": 10,
    "username": "test1"
  }
]
```

---

### Register New User
To create a new user.

```
POST /api/users
```
Parameter:
```
"user": {
  "username": "username",
  "password": "password",
  "password_confirmation": "password",
}
```
Success Response:
```
Status Code: 201
{
  "awakenings": [],
  "id": 11,
  "username": "te12st"
}
```
Failure Response:
```
Status Code: 422
{
  "errors": [
    "User name has already been taken"
  ]
}
```

---

### Create Awakening Record
To create a new awakening record. Note that authentication is needed for this endpoint. The `time` is formatted according to ISO 8601, a standardized date format.

```
POST /api/awakenings
```
Header:
```
Authorization:"Bearer your_autehntication_token"
```
Success Response:
```
Status Code: 201

{
  "time": "2017-11-14T01:37:11.666Z",
}
```
Failure Response:
```
Status Code: 401
```

## Bugs and Features Requests
The project is still under development. 

If there are any bugs/features request, feel free to create a new issues.
