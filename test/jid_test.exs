defmodule JidTest do
  use ExUnit.Case, async: true

  doctest JID

  test "String.Chars protocol converts structs to binaries" do
    jid = %JID{server: "example.com"}
    assert to_string(jid) == "example.com"

    jid = %JID{user: "jdoe", server: "example.com"}
    assert to_string(jid) == "jdoe@example.com"

    jid = %JID{user: "jdoe", server: "example.com", resource: "library"}
    assert to_string(jid) == "jdoe@example.com/library"
  end

  test "bare returns a JID without a resource" do
    jid = %JID{user: "jdoe", server: "example.com", resource: "library"}
    assert JID.bare(jid) == "jdoe@example.com"
    assert JID.bare("jdoe@example.com/library") == "jdoe@example.com"
    assert JID.bare("jdoe@example.com") == "jdoe@example.com"
  end

  test "it converts binaries into structs" do
    string = "jdoe@example.com"
    assert JID.parse(string) == %JID{user: "jdoe", server: "example.com", full: string}

    string = "jdoe@example.com/library"
    assert JID.parse(string) == %JID{user: "jdoe", server: "example.com", resource: "library", full: string}

    string = "jdoe@example.com/jdoe@example.com/resource"
    assert JID.parse(string) == %JID{user: "jdoe", server: "example.com", resource: "jdoe@example.com/resource", full: string}

    string = "example.com"
    assert JID.parse(string) == %JID{user: "", server: "example.com", resource: "", full: "example.com"}
  end

  test "user returns a user without a resource nor a server" do
    jid = %JID{user: "jdoe", server: "example.com", resource: "library"}
    assert JID.user(jid) == "jdoe"
    assert JID.user("jdoe@example.com/library") == "jdoe"
    assert JID.user("jdoe@example.com") == "jdoe"
  end

  test "server returns a server without a resource nor a user" do
    jid = %JID{user: "jdoe", server: "example.com", resource: "library"}
    assert JID.server(jid) == "example.com"
    assert JID.server("jdoe@example.com/library") == "example.com"
    assert JID.server("jdoe@example.com") == "example.com"
  end

  test "resource returns a resource without a server nor a user" do
    jid = %JID{user: "jdoe", server: "example.com", resource: "library"}
    assert JID.resource(jid) == "library"
    assert JID.resource("jdoe@example.com/library") == "library"
    assert JID.resource("jdoe@example.com") == ""
  end
end
