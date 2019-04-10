ruleset com.blacklite.woven_base {
  meta {
    author: "Michael Black"
  }

  rule process_heartbeat {
    select when wovyn heartbeat

    send_directive("hearbeat_event", {"message": "it's alive!"})
  }
}
