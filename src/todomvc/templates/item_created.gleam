import gleam/string_builder.{StringBuilder}
import gleam/list
import todomvc/templates/item as item_template
import todomvc/item.{Counts, Item}
import gleam/int

pub fn render_builder(
  item item: Item,
  counts counts: Counts,
  display display: Bool,
) -> StringBuilder {
  let builder = string_builder.from_string("")
  let builder =
    string_builder.append(
      builder,
      "

<input
  autofocus 
  required 
  maxlength=\"500\"
  class=\"new-todo\"
  placeholder=\"What needs to be complete?\"
  name=\"content\"
  autocomplete=\"off\"
>

",
    )
  let builder = case display {
    True -> {
      let builder =
        string_builder.append(
          builder,
          "
<div hx-swap-oob=\"afterbegin\" id=\"todo-list\">
  ",
        )
      let builder =
        string_builder.append_builder(
          builder,
          item_template.render_builder(item, False),
        )
      let builder = string_builder.append(builder, "
</div>
")
      builder
    }
    False -> builder
  }
  let builder =
    string_builder.append(
      builder,
      "

<div hx-swap-oob=\"innerHTML\" id=\"clear-completed\">
  ",
    )
  let builder = case item.any_completed(counts) {
    True -> {
      let builder = string_builder.append(builder, "
  Clear Completed (")
      let builder =
        string_builder.append(builder, int.to_string(counts.completed))
      let builder = string_builder.append(builder, ")
  ")
      builder
    }
    False -> builder
  }
  let builder =
    string_builder.append(
      builder,
      "
</div>

<span hx-swap-oob=\"innerHTML\" id=\"todo-count\">
  <strong>",
    )
  let builder = string_builder.append(builder, int.to_string(counts.active))
  let builder = string_builder.append(builder, "</strong> todos left
</span>
")

  builder
}

pub fn render(
  item item: Item,
  counts counts: Counts,
  display display: Bool,
) -> String {
  string_builder.to_string(render_builder(
    item: item,
    counts: counts,
    display: display,
  ))
}
