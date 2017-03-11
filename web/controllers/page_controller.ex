defmodule PostsXlsx.PageController do
  use PostsXlsx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
