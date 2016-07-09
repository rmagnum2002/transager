class CreateSubsidiaries < ActiveRecord::Migration
  def change
    create_table :subsidiaries do |t|
      t.string :name_en
      t.string :name_ro
      t.string :name_ru
      t.string :address_en
      t.string :address_ro
      t.string :address_ru
      t.string :gps
      t.string :external_id
      t.integer :position

      t.timestamps null: false
    end

    if Subsidiary.count == 0
      Subsidiary.create(
        name_en: 'Main Shop',
        name_ro: 'Magazin Central',
        name_ru: 'Главный Магазин',
        address_en: 'Chişinău, Uzinelor str. 171A',
        address_ro: 'Chişinău, str. Uzinelor 171A',
        address_ru: 'Кишинев, ул. Узинелор 171 A',
        position: 1,
        gps: '46.994187, 28.908864',
        external_id: 'Magazin_Chisinau'
      )
      Subsidiary.create(
        name_en: 'Subsidiary Chişinău',
        name_ro: 'Filiala Chişinău',
        name_ru: 'Филиал Кишинев',
        address_en: 'Chişinău, Hîncești str. 142',
        address_ro: 'Chişinău, str. Hîncești 142',
        address_ru: 'Кишинев, ул. Хынчешть 142',
        position: 2,
        gps: '46.992763, 28.786159',
        external_id: 'Magazin_Filial_Hincesti_142'
      )
      Subsidiary.create(
        name_en: 'Subsidiary Bălţi',
        name_ro: 'Filiala Bălţi',
        name_ru: 'Филиал Бельцы',
        address_en: 'Beltsy, Decebal str. 142',
        address_ro: 'Bălţi, str. Decebal 142',
        address_ru: 'Бельцы, ул. Дечебал 171 A',
        position: 3,
        gps: '47.782458, 27.889177',
        external_id: 'Magazin_Balti'
      )
      Subsidiary.create(
        name_en: 'Subsidiary Comrat',
        name_ro: 'Filiala Comrat',
        name_ru: 'Филиал Комрат',
        address_en: 'Comrat, Lenin str. 146',
        address_ro: 'Comrat, str. Lenin 146',
        address_ru: 'Комрат, ул. Ленина 146',
        position: 4,
        gps: '46.306992, 28.657343',
        external_id: 'Magazin_Comrat'
      )
      Subsidiary.create(
        name_en: 'Subsidiary Taraclia',
        name_ro: 'Filiala Taraclia',
        name_ru: 'Филиал Тараклия',
        address_en: 'Taraclia, Vokzalnaya str. 63',
        address_ro: 'Taraclia, str. Vokzalnaya 63',
        address_ru: 'Тараклия, ул. Вокзальная 63',
        position: 5,
        gps: '45.900018, 28.662761',
        external_id: 'Magazin_Taraclia'
      )
    end
  end
end
