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
  
