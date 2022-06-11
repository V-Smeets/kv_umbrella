import Config

config :kv, :routing_table, [{?a..?z, node()}]

{:ok, hostname} = :inet.gethostname()

if config_env() == :prod do
  config :kv, :routing_table, [
    {?a..?m, :"foo@#{hostname}"},
    {?n..?z, :"bar@#{hostname}"}
  ]
end
