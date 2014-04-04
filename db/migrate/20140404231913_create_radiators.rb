class CreateRadiators < ActiveRecord::Migration
  def change
    create_table :radiators do |t|

      t.timestamps
    end
  end
end
