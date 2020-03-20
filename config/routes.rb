Rails.application.routes.draw do



  # Routes for the Checkin resource:

  # CREATE
  post("/insert_checkin", { :controller => "checkins", :action => "create" })
          
  # READ
  get("/checkins", { :controller => "checkins", :action => "index" })
  
  get("/checkins/:path_id", { :controller => "checkins", :action => "show" })
  
  # UPDATE
  
  post("/modify_checkin/:path_id", { :controller => "checkins", :action => "update" })
  
  # DELETE
  get("/delete_checkin/:path_id", { :controller => "checkins", :action => "destroy" })

  #------------------------------

  # Routes for the Habit resource:

  # CREATE
  post("/insert_habit", { :controller => "habits", :action => "create" })
          
  # READ
  get("/habits", { :controller => "habits", :action => "index" })
  
  get("/habits/:path_id", { :controller => "habits", :action => "show" })
  
  # UPDATE
  
  post("/modify_habit/:path_id", { :controller => "habits", :action => "update" })
  
  # DELETE
  get("/delete_habit/:path_id", { :controller => "habits", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
