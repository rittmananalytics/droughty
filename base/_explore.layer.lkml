explore: wh_website_users_dim
view_name: wh_website_users_dim
join: wh_website_event_tracks_fact {
  sql_on: wh_website_event_tracks_fact.user_fk = wh_website_users_dim.user_pk ;;
}
join: wh_website_event_pages_fact {
  sql_on: wh_website_event_pages_fact.user_fk = wh_website_users_dim.user_pk ;;
}
