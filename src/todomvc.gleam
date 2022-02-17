import todomvc/web/service
import gleam/io
import gleam/int
import gleam/string
import gleam/result
import gleam/erlang
import gleam/erlang/os
import gleam/http/elli
import gleam/option
import gleam/pgo
import gleam/io

pub fn main() {
  let port =
    os.get_env("PORT")
    |> result.then(int.parse)
    |> result.unwrap(3000)

  io.println(string.concat([
    "Listening on localhost:",
    int.to_string(port),
    " ✨",
  ]))

  let db = start_database_connection_pool()
  let web = service.stack(db)
  assert Ok(_) = elli.become(web, on_port: port)
}

pub fn start_database_connection_pool() -> pgo.Connection {
  pgo.connect(
    pgo.Config(
      ..pgo.default_config(),
      host: "localhost",
      database: "gleam_todomvc_dev",
      user: "postgres",
      password: option.Some("postgres"),
      pool_size: 15,
    ),
  )
}
