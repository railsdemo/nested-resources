##Nested Resources Demo

A demo of nesting that follows these guidelines:

1. **Nested URL Structure** - *Resources should never nested more than 1 level deep* - Jamis Buck
2. **Site Pages** - Reserve potentially important page names ('about', 'help', 'contact', 'login', etc.)
3. **Common Data** - Common, public, or externally sourced information should have a separate sub-directory such as '/info/'.  This is a personal preference.

To demo this the following object hierarchy will be used:

- User > Notepad > Note
- Country > State > City (Common Information)


A mix of resources listed here:

- [Jamis Buck Article on Nested Resources](http://weblog.jamisbuck.org/2007/2/5/nesting-resources)
- [RailsGuides - Nested Resouces](http://guides.rubyonrails.org/routing.html#nested-resources)
- [Aaron Swartz - A Programmable Web, Ch. 2 Building for Users: Designing URLs](http://www.morganclaypool.com/doi/abs/10.2200/S00481ED1V01Y201302WBE005)
- [Helper method that is equivalent to *'belongs_to through'*](http://stackoverflow.com/a/7835634)

Rake Routes:

                 root        /                                                pages#home
                about GET    /about(.:format)                                 pages#about
                 help GET    /help(.:format)                                  pages#help
              contact GET    /contact(.:format)                               pages#contact
        notepad_notes GET    /notepads/:notepad_id/notes(.:format)            notes#index
                      POST   /notepads/:notepad_id/notes(.:format)            notes#create
     new_notepad_note GET    /notepads/:notepad_id/notes/new(.:format)        notes#new
            edit_note GET    /notes/:id/edit(.:format)                        notes#edit
                 note GET    /notes/:id(.:format)                             notes#show
                      PUT    /notes/:id(.:format)                             notes#update
                      DELETE /notes/:id(.:format)                             notes#destroy
        user_notepads GET    /users/:user_id/notepads(.:format)               notepads#index
                      POST   /users/:user_id/notepads(.:format)               notepads#create
     new_user_notepad GET    /users/:user_id/notepads/new(.:format)           notepads#new
         edit_notepad GET    /notepads/:id/edit(.:format)                     notepads#edit
              notepad GET    /notepads/:id(.:format)                          notepads#show
                      PUT    /notepads/:id(.:format)                          notepads#update
                      DELETE /notepads/:id(.:format)                          notepads#destroy
                users GET    /users(.:format)                                 users#index
                      POST   /users(.:format)                                 users#create
             new_user GET    /users/new(.:format)                             users#new
            edit_user GET    /users/:id/edit(.:format)                        users#edit
                 user GET    /users/:id(.:format)                             users#show
                      PUT    /users/:id(.:format)                             users#update
                      DELETE /users/:id(.:format)                             users#destroy
         state_cities GET    /info/states/:state_id/cities(.:format)          cities#index
                      POST   /info/states/:state_id/cities(.:format)          cities#create
       new_state_city GET    /info/states/:state_id/cities/new(.:format)      cities#new
            edit_city GET    /info/cities/:id/edit(.:format)                  cities#edit
                 city GET    /info/cities/:id(.:format)                       cities#show
                      PUT    /info/cities/:id(.:format)                       cities#update
                      DELETE /info/cities/:id(.:format)                       cities#destroy
       country_states GET    /info/countries/:country_id/states(.:format)     states#index
                      POST   /info/countries/:country_id/states(.:format)     states#create
    new_country_state GET    /info/countries/:country_id/states/new(.:format) states#new
           edit_state GET    /info/states/:id/edit(.:format)                  states#edit
                state GET    /info/states/:id(.:format)                       states#show
                      PUT    /info/states/:id(.:format)                       states#update
                      DELETE /info/states/:id(.:format)                       states#destroy
            countries GET    /info/countries(.:format)                        countries#index
                      POST   /info/countries(.:format)                        countries#create
          new_country GET    /info/countries/new(.:format)                    countries#new
         edit_country GET    /info/countries/:id/edit(.:format)               countries#edit
              country GET    /info/countries/:id(.:format)                    countries#show
                      PUT    /info/countries/:id(.:format)                    countries#update
                      DELETE /info/countries/:id(.:format)                    countries#destroy