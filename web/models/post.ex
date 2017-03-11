defmodule PostsXlsx.Post do
  use PostsXlsx.Web, :model

  schema "posts" do
    field :name, :string
    field :title, :string
    field :content, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :title, :content])
    |> validate_required([:name, :title, :content])
  end
end
