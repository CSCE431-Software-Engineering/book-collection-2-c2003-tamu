class AddDetailsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :publisher, :string
    add_column :books, :pages, :integer
    add_column :books, :release_date, :date
  end
end
