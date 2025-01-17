# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150721161922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "averages", force: :cascade do |t|
    t.float    "gh_users_stars",         default: 0.0
    t.float    "gh_users_followers",     default: 0.0
    t.float    "gh_users_forks",         default: 0.0
    t.float    "gh_users_following",     default: 0.0
    t.float    "gh_users_ff_ratio",      default: 0.0
    t.float    "so_users_answers",       default: 0.0
    t.float    "so_users_questions",     default: 0.0
    t.float    "so_users_down_votes",    default: 0.0
    t.float    "so_users_up_votes",      default: 0.0
    t.float    "so_users_reputation",    default: 0.0
    t.float    "so_users_gold_badges",   default: 0.0
    t.float    "so_users_silver_badges", default: 0.0
    t.float    "so_users_bronze_badges", default: 0.0
    t.float    "tw_users_followers",     default: 0.0
    t.float    "tw_users_friends",       default: 0.0
    t.float    "tw_users_favourites",    default: 0.0
    t.float    "tw_users_listed",        default: 0.0
    t.float    "tw_users_statuses",      default: 0.0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "users_total_score",      default: 0.0
  end

  create_table "github_repos", force: :cascade do |t|
    t.integer  "github_user_id"
    t.string   "gh_owner_name"
    t.string   "owner_id"
    t.string   "name"
    t.string   "full_name"
    t.boolean  "gh_private"
    t.string   "html_url"
    t.string   "description"
    t.boolean  "fork"
    t.string   "url"
    t.date     "gh_created_at"
    t.date     "gh_updated_at"
    t.date     "gh_pushed_at"
    t.string   "git_url"
    t.string   "clone_url"
    t.string   "ssh_url"
    t.string   "svn_url"
    t.string   "homepage"
    t.integer  "size"
    t.integer  "stars_count"
    t.integer  "watchers_count"
    t.integer  "forks_count"
    t.string   "language"
    t.boolean  "has_issues"
    t.boolean  "has_downloads"
    t.string   "mirror_url"
    t.integer  "open_issues_count"
    t.integer  "watchers"
    t.string   "default_branch"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "repo_id"
  end

  add_index "github_repos", ["github_user_id"], name: "index_github_repos_on_github_user_id", using: :btree

  create_table "github_users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "login"
    t.string   "avatar_url"
    t.string   "gravatar_id"
    t.string   "url"
    t.string   "html_url"
    t.string   "followers_url"
    t.string   "gists_url"
    t.string   "subscriptions_url"
    t.string   "organizations_url"
    t.string   "repos_url"
    t.string   "events_url"
    t.string   "received_events_url"
    t.string   "site_admin"
    t.string   "name"
    t.string   "company"
    t.string   "blog"
    t.string   "location"
    t.string   "email"
    t.boolean  "hireable"
    t.integer  "public_repos"
    t.integer  "public_gists"
    t.integer  "followers"
    t.integer  "following"
    t.date     "gh_created"
    t.date     "gh_updated"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "user_type"
    t.integer  "gh_id"
  end

  add_index "github_users", ["user_id"], name: "index_github_users_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 8
    t.integer  "followed_id", limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "stack_badges", force: :cascade do |t|
    t.integer  "stack_user_id"
    t.integer  "so_user_id"
    t.string   "badge_type"
    t.integer  "award_count"
    t.string   "badge_rank"
    t.integer  "so_badge_id"
    t.string   "badge_link"
    t.string   "description"
    t.string   "badge_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stack_badges", ["stack_user_id"], name: "index_stack_badges_on_stack_user_id", using: :btree

  create_table "stack_users", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "about_me"
    t.integer  "account_id"
    t.integer  "age"
    t.integer  "answer_count"
    t.integer  "bc_bronze"
    t.integer  "bc_silver"
    t.integer  "bc_gold"
    t.datetime "creation_date"
    t.string   "display_name"
    t.integer  "down_vote_count"
    t.boolean  "is_employee"
    t.date     "last_access_date"
    t.date     "last_modified_date"
    t.string   "link"
    t.string   "location"
    t.string   "profile_image"
    t.integer  "question_count"
    t.integer  "reputation"
    t.integer  "reputation_change_day"
    t.integer  "reputation_change_month"
    t.integer  "reputation_change_quarter"
    t.integer  "reputation_change_week"
    t.integer  "reputation_change_year"
    t.integer  "up_vote_count"
    t.string   "user_type"
    t.integer  "view_count"
    t.string   "website_url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "access_token"
    t.integer  "so_user_id"
  end

  add_index "stack_users", ["user_id"], name: "index_stack_users_on_user_id", using: :btree

  create_table "statistics", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "score",      precision: 4, scale: 2
    t.string   "score_type"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "statistics", ["user_id"], name: "index_statistics_on_user_id", using: :btree

  create_table "twitter_users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "tw_created_at"
    t.integer  "twitter_id",        limit: 8
    t.string   "screen_name"
    t.string   "name"
    t.text     "description"
    t.string   "lang"
    t.string   "location"
    t.string   "time_zone"
    t.string   "profile_image_url"
    t.string   "url"
    t.boolean  "notifications"
    t.boolean  "verified"
    t.boolean  "tw_protected"
    t.string   "id_str"
    t.integer  "favourites_count"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.integer  "listed_count"
    t.integer  "statuses_count"
    t.string   "secret"
  end

  add_index "twitter_users", ["user_id"], name: "index_twitter_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "password"
    t.string   "user_type"
    t.integer  "user_score",                       default: 0
    t.string   "access_token"
    t.string   "user_bio"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "profile_image_url"
    t.string   "user_name"
    t.string   "blog"
    t.string   "user_level"
    t.integer  "tw_id",                  limit: 8
    t.string   "user_bio_display"
    t.string   "user_full_name_display"
    t.string   "user_email_display"
    t.string   "user_blog_display"
  end

end
