class AddStatesToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :pending_at, :datetime
    add_column :questions, :approved_at, :datetime
    add_column :questions, :reproved_at, :datetime
  end
end
