defmodule PostsXlsx.Reports.PostController do
  use PostsXlsx.Web, :controller

  alias PostsXlsx.Post

  def index(conn, _params) do
    posts =
      Post
      |> limit(10_000)
      |> Repo.all

    conn
    |> put_resp_content_type("text/xlsx")
    |> put_resp_header("content-disposition", "attachment; filename=posts_report.xlsx")
    |> render("report.xlsx", %{posts: posts})
  end
end

