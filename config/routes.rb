Rails.application.routes.draw do
  get 'drafts/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, skip: [:registrations]
  ActiveAdmin.routes(self)
  
  unauthenticated :user do
    devise_scope :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
  
  authenticated :user do
    resource :my_picks, only: :show
    
    # root "seasons#show_active_season"
    resources :leagues do
      resource :draft, only: :show
    end
    root "leagues#latest_league"
  end
  resource :all_picks, only: :show
  resources :picks, only: [:update] do 
    resource :lock
  end

  resources :seasons do 
    resources :season_lines, only: [:index]
  end

end

#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                               admin_root GET    /admin(.:format)                                                                                  admin/dashboard#index
#                          admin_dashboard GET    /admin/dashboard(.:format)                                                                        admin/dashboard#index
#            enroll_all_users_admin_league POST   /admin/leagues/:id/enroll_all_users(.:format)                                                     admin/leagues#enroll_all_users
#                 build_draft_admin_league POST   /admin/leagues/:id/build_draft(.:format)                                                          admin/leagues#build_draft
#               batch_action_admin_leagues POST   /admin/leagues/batch_action(.:format)                                                             admin/leagues#batch_action
#                            admin_leagues GET    /admin/leagues(.:format)                                                                          admin/leagues#index
#                                          POST   /admin/leagues(.:format)                                                                          admin/leagues#create
#                         new_admin_league GET    /admin/leagues/new(.:format)                                                                      admin/leagues#new
#                        edit_admin_league GET    /admin/leagues/:id/edit(.:format)                                                                 admin/leagues#edit
#                             admin_league GET    /admin/leagues/:id(.:format)                                                                      admin/leagues#show
#                                          PATCH  /admin/leagues/:id(.:format)                                                                      admin/leagues#update
#                                          PUT    /admin/leagues/:id(.:format)                                                                      admin/leagues#update
#                                          DELETE /admin/leagues/:id(.:format)                                                                      admin/leagues#destroy
#                 batch_action_admin_picks POST   /admin/picks/batch_action(.:format)                                                               admin/picks#batch_action
#                              admin_picks GET    /admin/picks(.:format)                                                                            admin/picks#index
#                                          POST   /admin/picks(.:format)                                                                            admin/picks#create
#                           new_admin_pick GET    /admin/picks/new(.:format)                                                                        admin/picks#new
#                          edit_admin_pick GET    /admin/picks/:id/edit(.:format)                                                                   admin/picks#edit
#                               admin_pick GET    /admin/picks/:id(.:format)                                                                        admin/picks#show
#                                          PATCH  /admin/picks/:id(.:format)                                                                        admin/picks#update
#                                          PUT    /admin/picks/:id(.:format)                                                                        admin/picks#update
#                                          DELETE /admin/picks/:id(.:format)                                                                        admin/picks#destroy
#          batch_action_admin_season_lines POST   /admin/season_lines/batch_action(.:format)                                                        admin/season_lines#batch_action
#                       admin_season_lines GET    /admin/season_lines(.:format)                                                                     admin/season_lines#index
#                                          POST   /admin/season_lines(.:format)                                                                     admin/season_lines#create
#                    new_admin_season_line GET    /admin/season_lines/new(.:format)                                                                 admin/season_lines#new
#                   edit_admin_season_line GET    /admin/season_lines/:id/edit(.:format)                                                            admin/season_lines#edit
#                        admin_season_line GET    /admin/season_lines/:id(.:format)                                                                 admin/season_lines#show
#                                          PATCH  /admin/season_lines/:id(.:format)                                                                 admin/season_lines#update
#                                          PUT    /admin/season_lines/:id(.:format)                                                                 admin/season_lines#update
#                                          DELETE /admin/season_lines/:id(.:format)                                                                 admin/season_lines#destroy
#               batch_action_admin_seasons POST   /admin/seasons/batch_action(.:format)                                                             admin/seasons#batch_action
#                            admin_seasons GET    /admin/seasons(.:format)                                                                          admin/seasons#index
#                                          POST   /admin/seasons(.:format)                                                                          admin/seasons#create
#                         new_admin_season GET    /admin/seasons/new(.:format)                                                                      admin/seasons#new
#                        edit_admin_season GET    /admin/seasons/:id/edit(.:format)                                                                 admin/seasons#edit
#                             admin_season GET    /admin/seasons/:id(.:format)                                                                      admin/seasons#show
#                                          PATCH  /admin/seasons/:id(.:format)                                                                      admin/seasons#update
#                                          PUT    /admin/seasons/:id(.:format)                                                                      admin/seasons#update
#                                          DELETE /admin/seasons/:id(.:format)                                                                      admin/seasons#destroy
#                 batch_action_admin_users POST   /admin/users/batch_action(.:format)                                                               admin/users#batch_action
#                              admin_users GET    /admin/users(.:format)                                                                            admin/users#index
#                                          POST   /admin/users(.:format)                                                                            admin/users#create
#                           new_admin_user GET    /admin/users/new(.:format)                                                                        admin/users#new
#                          edit_admin_user GET    /admin/users/:id/edit(.:format)                                                                   admin/users#edit
#                               admin_user GET    /admin/users/:id(.:format)                                                                        admin/users#show
#                                          PATCH  /admin/users/:id(.:format)                                                                        admin/users#update
#                                          PUT    /admin/users/:id(.:format)                                                                        admin/users#update
#                                          DELETE /admin/users/:id(.:format)                                                                        admin/users#destroy
#                           admin_comments GET    /admin/comments(.:format)                                                                         admin/comments#index
#                                          POST   /admin/comments(.:format)                                                                         admin/comments#create
#                            admin_comment GET    /admin/comments/:id(.:format)                                                                     admin/comments#show
#                                          DELETE /admin/comments/:id(.:format)                                                                     admin/comments#destroy
#                         new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
#                            user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
#                                          PUT    /users/password(.:format)                                                                         devise/passwords#update
#                                          POST   /users/password(.:format)                                                                         devise/passwords#create
#                   accept_user_invitation GET    /users/invitation/accept(.:format)                                                                devise/invitations#edit
#                   remove_user_invitation GET    /users/invitation/remove(.:format)                                                                devise/invitations#destroy
#                      new_user_invitation GET    /users/invitation/new(.:format)                                                                   devise/invitations#new
#                          user_invitation PATCH  /users/invitation(.:format)                                                                       devise/invitations#update
#                                          PUT    /users/invitation(.:format)                                                                       devise/invitations#update
#                                          POST   /users/invitation(.:format)                                                                       devise/invitations#create
#                     unauthenticated_root GET    /                                                                                                 devise/sessions#new
#                                 my_picks GET    /my_picks(.:format)                                                                               my_picks#show
#                                     root GET    /                                                                                                 seasons#show_active_season
#                                all_picks GET    /all_picks(.:format)                                                                              all_picks#show
#                            new_pick_lock GET    /picks/:pick_id/lock/new(.:format)                                                                locks#new
#                           edit_pick_lock GET    /picks/:pick_id/lock/edit(.:format)                                                               locks#edit
#                                pick_lock GET    /picks/:pick_id/lock(.:format)                                                                    locks#show
#                                          PATCH  /picks/:pick_id/lock(.:format)                                                                    locks#update
#                                          PUT    /picks/:pick_id/lock(.:format)                                                                    locks#update
#                                          DELETE /picks/:pick_id/lock(.:format)                                                                    locks#destroy
#                                          POST   /picks/:pick_id/lock(.:format)                                                                    locks#create
#                                     pick PATCH  /picks/:id(.:format)                                                                              picks#update
#                                          PUT    /picks/:id(.:format)                                                                              picks#update
#                      season_season_lines GET    /seasons/:season_id/season_lines(.:format)                                                        season_lines#index
#                                  seasons GET    /seasons(.:format)                                                                                seasons#index
#                                          POST   /seasons(.:format)                                                                                seasons#create
#                               new_season GET    /seasons/new(.:format)                                                                            seasons#new
#                              edit_season GET    /seasons/:id/edit(.:format)                                                                       seasons#edit
#                                   season GET    /seasons/:id(.:format)                                                                            seasons#show
#                                          PATCH  /seasons/:id(.:format)                                                                            seasons#update
#                                          PUT    /seasons/:id(.:format)                                                                            seasons#update
#                                          DELETE /seasons/:id(.:format)                                                                            seasons#destroy
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create