local wibox = require("wibox")
local gears = require("gears")
local colorscheme = require("colorscheme")

local container_taglist_widget = wibox.container

local taglist_widget = wibox.widget({
  align = "center",
  valign = "center",
  font = "JetBrainsMonoNerdFont 11",
  widget = wibox.widget.textbox
})

container_taglist_widget = {
  {}
}
