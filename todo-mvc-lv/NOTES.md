### Lecture notes

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
