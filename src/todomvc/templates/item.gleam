// DO NOT EDIT: Code generated by matcha from item.matcha

import gleam/string_builder.{StringBuilder}
import gleam/list
import todomvc/item.{Item}
import todomvc/web
import gleam/int

pub fn render_builder(item item: Item, editing editing: Bool) -> StringBuilder {
  let builder = string_builder.from_string("")
  let builder = string_builder.append(builder, "

<li 
  id=\"item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
  class=\"")
  let builder = case item.completed {
    True -> {
      let builder = string_builder.append(builder, "completed")
      builder
    }
    False -> builder
  }
  let builder = string_builder.append(builder, " ")
  let builder = case editing {
    True -> {
      let builder = string_builder.append(builder, "editing")
      builder
    }
    False -> builder
  }
  let builder =
    string_builder.append(
      builder,
      "\"
>
  <div class=\"view\">
    <input
      class=\"toggle\"
      type=\"checkbox\"
      autocomplete=\"off\"
      ",
    )
  let builder = case item.completed {
    True -> {
      let builder = string_builder.append(builder, "checked")
      builder
    }
    False -> builder
  }
  let builder = string_builder.append(builder, "
    >

    <label>
      ")
  let builder = string_builder.append(builder, web.escape(item.content))
  let builder =
    string_builder.append(
      builder,
      "
    </label>

    <a
      class=\"edit-btn\"
      hx-get=\"/todos/",
    )
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
      hx-target=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder =
    string_builder.append(
      builder,
      "\"
    >✎</a>

    <button
      class=\"destroy\"
      hx-delete=\"/todos/",
    )
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
      hx-target=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
      hx-indicator=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder =
    string_builder.append(
      builder,
      "\"
    ></button>
    </form>

    <form
      class=\"todo-mark\"
      hx-patch=\"/todos/",
    )
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder =
    string_builder.append(builder, "/completion\"
      hx-target=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
      hx-indicator=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder =
    string_builder.append(
      builder,
      "\"
      hx-swap=\"outerHTML\"
    >
      <button></button>
    </form>
  </div>

  <input 
    ",
    )
  let builder = case editing {
    True -> {
      let builder =
        string_builder.append(
          builder,
          "
    autofocus
    onfocus=\"this.setSelectionRange(this.value.length,this.value.length)\"
    ",
        )
      builder
    }
    False -> builder
  }
  let builder =
    string_builder.append(
      builder,
      "
    required
    maxlength=\"500\"
    class=\"edit\"
    type=\"text\"
    name=\"content\"
    value=\"",
    )
  let builder = string_builder.append(builder, web.escape(item.content))
  let builder = string_builder.append(builder, "\"
    hx-patch=\"/todos/")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder = string_builder.append(builder, "\"
    hx-target=\"#item-")
  let builder = string_builder.append(builder, int.to_string(item.id))
  let builder =
    string_builder.append(
      builder,
      "\"
    hx-swap=\"outerHTML\"
    hx-trigger=\"blur,keypress[key == 'Enter']\"
  >
",
    )

  builder
}

pub fn render(item item: Item, editing editing: Bool) -> String {
  string_builder.to_string(render_builder(item: item, editing: editing))
}
