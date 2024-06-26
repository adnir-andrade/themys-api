ActiveRecord::Schema[7.1].define(version: 2024_06_24_013918) do
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.bigint "dm_id"
    t.string "name"
    t.date "next_session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dm_id"], name: "index_campaigns_on_dm_id"
  end

  create_table "campaigns_players", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_id"
    t.index ["campaign_id"], name: "index_campaigns_players_on_campaign_id"
    t.index ["character_id"], name: "index_campaigns_players_on_character_id"
    t.index ["player_id"], name: "index_campaigns_players_on_player_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "player_id"
    t.string "name"
    t.integer "level"
    t.string "gender"
    t.string "race"
    t.string "first_class"
    t.integer "first_class_level"
    t.string "second_class"
    t.integer "second_class_level"
    t.string "subclass"
    t.string "background"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "max_hp"
    t.integer "current_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaigns_player_id", null: false
    t.index ["campaigns_player_id"], name: "index_characters_on_campaigns_player_id"
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_inventories_on_character_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_stacks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "inventory_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_items_stacks_on_inventory_id"
    t.index ["item_id"], name: "index_items_stacks_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "users", column: "dm_id"
  add_foreign_key "campaigns_players", "campaigns"
  add_foreign_key "campaigns_players", "characters"
  add_foreign_key "campaigns_players", "users", column: "player_id"
  add_foreign_key "characters", "campaigns_players"
  add_foreign_key "characters", "users", column: "player_id"
  add_foreign_key "inventories", "characters"
  add_foreign_key "items_stacks", "inventories"
  add_foreign_key "items_stacks", "items"
end
