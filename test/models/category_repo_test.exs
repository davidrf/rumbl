defmodule Rumbl.CategoryRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.Category

  @valid_attrs %{name: "A Category", username: "eva"}
  @invalid_attrs %{}

  test "alphabetical/1 orders by name" do
    Repo.insert!(%Category{name: "c"})
    Repo.insert!(%Category{name: "a"})
    Repo.insert!(%Category{name: "b"})

    query = Category |> Category.alphabetical
    query = from c in query, select: c.name
    assert Repo.all(query) === ~w(a b c)
  end
end
