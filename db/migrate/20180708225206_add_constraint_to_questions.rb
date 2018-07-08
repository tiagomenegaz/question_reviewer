class AddConstraintToQuestions < ActiveRecord::Migration[5.2]
  def up
    execute(
      <<~SQL
        ALTER TABLE questions ADD CONSTRAINT questions_valid_state CHECK (
          pending_at IS NOT NULL OR
          approved_at IS NOT NULL OR
          reproved_at IS NOT NULL
        );
      SQL
    )
  end

  def down
    execute(
      <<~SQL
        ALTER TABLE questions DROP CONSTRAINT questions_valid_state;
      SQL
    )
  end
end
