adding authentication -- todo mvc

- authorization means: can the user do what they want to do
db:
- user model, email

urls:
- get '/users/new' users#new
  form
- post '/users' users#create 
  create the user in the db

- get '/login'
  form
- post '/sessions'
  "log the user in"


we want views to be declarative - no logic
## step 8: users have lists and can only see their lists

## step 7: user sign up and login

## Final Step 6: Delete items from list

## refactor: Start using partials in list show

## suppose list, item exists and has id in db
  - through form_for([list, item]) rails knows we want to go to the edit page and creates a patch request

## debugging magic lessons:
  <%raise item.inspect if item.id.nil?%>
    + when we start the list show page, we generate a new, nil list item
    + so when we iterate through list.items, we hit that nil list item
    + we don't need to wrap the new item structure to list for form - we can do that after submission
    + change @item = List.items.build to @item = Item.new in lists_controller
##  rake routes | grep items
PATCH  /lists/:list_id/items/:id(.:format)      items#update
  url: list_item_path(@list, item)
##  // ♥rails g migration AddStatusToItems status:integer
    Add*Field*To*Table* *field*:*datatype*
    but! default status should be 0

## Step 5: NEXT! Add a state to mark complete, incomplete!
  + mark items
  + get working without js, ajax -- then add that layer
  + what urls do you need?
    - new forms for updating the status of an item => new URL
      /lists/1/items
        PUTS/PATCH to lists/1/items/1 -- update item 1 in list 1
        PUTS/PATCH to lists/:list_id/items/:id

  + how will my db change
    - item being complete or incomplete requires data
  + I need the checkboxes from todmvc.com



### INSTANCE VARIABLES ONLY PERSIST THROUGH ONE request
### ActiveRecord only adds errors when you try to save or validate an INSTANCE

## Step 4: validations!
  + validate that lists have name
  + validate that items have a description
  + RAILS knows that there is a "field_with_errors" DIV
  + when you render, you are not creating another request



### FORM FOR - PASS AN ARRAY
  + form_for [item1, item2]
    - item 1 is current resource
    - item 2 is object related to form
    - create an item 2 associated with item 1
    - creates: item1_item2s_path(@list)


### DO NOT REFER TO MODELS DIRECTLY IN VIEW PAGE CUZ AVI SAID SO

@list.items.build
  - calling collection method, build method -- returns new object of the collection type that has been instantiated through attributes with foreign key id

##next step: add items to a list
 + I need a lists table
 + CREATE action for an item in a list
 + what is the url/http method for that
 + items don't need show page
 + make the items in the list real


 + add validations?


 # wiring the schema (DB)
 # wire the model with association

this about what has_many, belongs_to is doing. What methods is this creating?
 - bc of belongs_to, milk.list will return, set list


 ## list.items.create
  returns a new object of the collection type that has been instantiated with attributes linked to this object through a foreign key


  + form is present in list show page
  + this implies a POST lists/:id/items URL
      - but we need to know which list we are adding to
      - an item doesn't exist in our application outside of teh context of the list it belongs to
  + items are nested within lists, in terms of url -- items belong to lists and are nested


  ---

  after changing routes file, run rake routes

 ----

 ## describe list
  + lists | name |      |
  | :------------- | :------------- |
  |2 | Shopping List       |

  + items |  | describe     |
  | :------------- | :------------- |
  | Item One       | Item Two       |

## later - add checkboxes


----
### Lecture 1 notes

1. integrate basic theme. this is a stylized app, so get the asset pipeline set up first
run server
/ - see a stubbed out, non-dynamic, page with theme





think about narrative of app:
2. Users create lists. Add item to those lists. Navigate many lists and see each list items.

** look at the nouns to find models **
THINK OF BASE TO START. don't worry about users, extra to start.

## lists
  has many items

## items
  belongs to a list

3. ^^ don't worry about models yet. CRUD lists (create, retrieve, update, delete)

[ ] ListsController
  #index
  + see all their lists
  + doubling as #new action - create a list
  / - Index all the lists...
  + show a list

  + I know I need a model + controller => generate a resource


  with every new view, ask yourself:
  Does it impact the DB?
  Does it impact my URLS?
  '/lists/1' => list_path(list), where list has id 1
  'http://localhost:3000/lists/1' => list_url(list)

  lists_path, new_list_path, edit_list_path


  list/:id
  + id is a route variable

## forms are like envelope - contain address, how to get there

form_for(instance of activerecord ) do |f|
generates

form class="new_list" id="new_list" action="/lists"

# redirects should use a full url
