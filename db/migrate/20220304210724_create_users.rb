class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_email
      t.string :password_digest
      t.boolean :is_teacher
      t.string :name
      t.text :education
      t.text :bio
      t.text :subjects
      t.string :zipcode
      t.string :preferred_contact
      t.string :image_url

      t.timestamps
    end
  end
end
