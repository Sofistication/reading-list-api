# Book.next API

API for lists used in [Book.next](https://github.com/Sofistication/book-next).

## API Endpoints

| Verb | URI Pattern | Controller#Action |
|---|---|---|
| POST | `/sign-up` | `users#signup` |
| POST | `/sign-in` | `users#signin` |
| DELETE | `/sign-out/:id` | `users#signout` |
| PATCH | `/change-password/:id` | `users#changepw` |
| GET | `/books` | `books#index` |
| GET | `/books/:id` | `books#show` |
| GET | `/lists` | `books#lists` |

## Book actions

To be filled

## List actions

To be filled
