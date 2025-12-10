
# Ballerina Solace SEMP v2 Connector

This Ballerina module provides a connector for interacting with Solace PubSub+ brokers via the **SEMP v2** (Solace Element Management Protocol, version 2) — the REST-based management API for configuring and monitoring Solace message brokers. ([Solace Docs][https://docs.solace.com/Admin/SEMP/Using-SEMP.htm])

With this connector you can programmatically perform broker administrative operations from your Ballerina application: for example, create or configure message VPNs, queues, topic endpoints; monitor queue or topic stats; manage clients; and trigger administrative actions such as message purge or broker HA control — all via SEMP v2’s structured JSON API.
