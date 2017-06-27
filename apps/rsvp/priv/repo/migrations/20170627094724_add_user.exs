defmodule Rsvp.Repo.Migrations.AddUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, size: 20
      add :first_name, :string, size: 20
      add :last_name, :string, size: 20
      add :email, :string, size: 20
      add :password_hash, :string, size: 20

      timestamps
    end
  end
end
