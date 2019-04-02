class AllowAmountQuantityFractions < ActiveRecord::Migration[5.2]
  def up
    if column_exists? :amounts, :quantity
      change_column :amounts, :quantity, :string
    end
  end

  def down
    if column_exists? :amounts, :quantity
      change_column :amounts, :quantity, :decimal
    end
  end
end
