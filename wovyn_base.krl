ruleset com.blacklite.wovyn_base {
  meta {
    name "Wovyn Base"
    author "Michael Black"
  }

  rule process_heartbeat {
    select when wovyn heartbeat

    send_directive("hearbeat_event", {"message": "it's alive!"})
  }
}
