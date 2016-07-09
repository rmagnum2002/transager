class AddSubsidiaryIdToContacts < ActiveRecord::Migration
  def change
    # add_reference :contacts, :subsidiary_id, index: true, foreign_key: true
    add_column :contacts, :subsidiary_id, :integer, index:true, foreign_key: true

    contacts = {
      '1' => {
        '1' => '22472525',
        '3' => '78472525'
      },
      '2' => {
        '1' => '22725433',
        '3' => '78809044'
      },
      '3' => {
        '1' => '23193050',
        '3' => '79406896'
      },
      '4' => {
        '1' => '29833001',
        '3' => '79704070'
      },
      '5' => {
        '1' => '29424707',
        '3' => '79408898'
      }
    }

    Subsidiary.all.each_with_index do |office, index|
      next if office.contacts.any?
      Contact.create!(contact_type: 1, details: contacts["#{index + 1}"]['1'], subsidiary_id: office.id, department_id: 5)
      Contact.create!(contact_type: 3, details: contacts["#{index + 1}"]['3'], subsidiary_id: office.id, department_id: 5)
    end
  end
end
