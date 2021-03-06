# Book.next API

API for lists used in [Book.next](https://github.com/Sofistication/book-next).

## Breaking Changes

Implementation of Readings changes the top level key of the `books#lists` action from `books` to `readings`

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
| POST | `/books` | `books#create` |
| POST | `/readings` | `readings#create` |
| PATCH | `/readings/:id` | `readings#update` |
| DELETE | `/readings/:id` | `readings#destroy` |

## User actions

*Summary*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

## Book actions

*Summary*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/books[?title=title&author=author]`</td>
<td>empty</td>
<td>200, OK</td>
<td><strong>books found</strong></td>
</tr>
<tr>
  <td colspan="3">
  The optional `search` parameters restrict the response to games with a
   matching `title`, `author` or both, depending on the query sent.
  </td>
  <td>200, OK</td>
  <td><em>empty books</em></td>
</tr>
<tr>
  <td colspan="3">
  The default is to retrieve all books stored in the database.
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>GET</td>
<td>`/books/:id`</td>
<td>empty</td>
<td>200 OK</td>
<td><strong>book</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<td>GET</td>
<td>`/lists`</td>
<td>empty</td>
<td>200, OK</td>
<td><strong>user readings</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401, Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/books`</td>
<td><strong>book</strong></td>
<td>201 Created</td>
<td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
</table>

## Readings actions

*Summary*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/readings`</td>
<td><strong>reading</strong></td>
<td>201, Created</td>
<td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  If the user already has a reading associated with the book, a new reading will not be created
  </td>
  <td>409 Conflict</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/readings/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/readings/:id`</td>
<td><strong>reading</strong></td>
<td>204 No Content</td>
<td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
</table>
