defmodule SampleApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
