Set up the following roles:
 + Owner can delete the list
 + collaborator can add items
 + Guest can view the list

* shared lists is the model that can describe the relationship between a user and list

0 top level
higher numbers less

-- use pundit

shared_lists
user_id   list_id   permission
1           1       0 #=> Owner
2           1       10 #=> collaborator
