-----------------------
-- Brightness Widget --
-----------------------
local awful = require("awful")
local colorscheme = require("colorscheme")
local wibox = require("wibox")
local gears = require("gears")

local container_brightness_widget = wibox.container

local brightness_widget = wibox.widget({
    align = "center",
    valign = "center",
    font = "JetBrainsMonoNerdFont 11",
    widget = wibox.widget.textbox
})

local function update_brightness_widget(widget)
    awful.spawn.easy_async("light -G", function(stdout)
	    local brightness = math.floor(stdout)
	    widget.text = "󰖨" .. " " .. brightness .. "%"
    end)
end

update_brightness_widget(brightness_widget)

container_brightness_widget = {
    {
	    {
		    {
			    {
				    widget = brightness_widget,
			    },
			    left = 10,
			    right = 10,
			    widget = wibox.container.margin,
		    },
		    shape = gears.shape.rounded_bar,
		    fg = colorscheme.color["yellow"],
		    bg = colorscheme.color["surface0"],
		    widget = wibox.container.background,
	    },
	    top = 4,
	    bottom = 4,
	    widget = wibox.container.margin,
    },
    spacing = 5,
    layout = wibox.layout.fixed.horizontal,
}

return {
    brightness_widget = brightness_widget,
    container_brightness_widget = container_brightness_widget,
    update_brightness_widget = update_brightness_widget
}
