# PhoenixSample(API)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## request
signup
```
curl -X POST \
  http://localhost:4000/api/signup \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 63a30774-9070-43be-a5d2-1178f18ec3db' \
  -H 'cache-control: no-cache' \
  -d '{
	"email": "foo5@bar.com",
	"name": "taro",
	"password": "abcabc"
}'
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
