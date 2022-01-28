explore: wh_website_users_dim
view_name: wh_website_users_dim
join: wh_website_event_pages_fct {
  sql_on: wh_website_event_pages_fct.user_blended_fk = wh_website_users_dim.user_blended_pk ;;
}
join: wh_website_event_tracks_fct {
  sql_on: wh_website_event_tracks_fct.user_blended_fk = wh_website_users_dim.user_blended_pk ;;
}
