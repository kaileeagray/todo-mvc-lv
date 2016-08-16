### refactor, build helper for content_tag_for :li, item, :class => li_class_for_item(item) do
  + li_for_item

### <%=render :collection => @list.items, :partial => "items/item_li", :as => :item%>
if your partial was "items/item" you could remove as: :item
or you can rename local variables to item_li to remove :as => :item


## add checkbox HTML from todomvc
+ add to view:
  <input class="toggle type="checkbox">
+ need JS function to submit the form when you click the checkbox

  $(function()){
    $("input.toggle").on("change", function(){
      $(this).parents("form").trigger("submit")
    })
  });

## toggle button
<form class="edit_item" id="edit_item_2" action="/lists/2/items/2" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch"><input type="hidden" name="authenticity_token" value="o/VRTgd2HGSueb5piCcJL6D/rrdmjYCsVek/KUL53C/Qxx2I86cYEszUc3Nooc+Ugr8xA07j5n071NnNto7YhA==">
            <input name="item[status]" type="hidden" value="0"><input class="toggle" type="checkbox" value="1" name="item[status]" id="item_status">
</form>
