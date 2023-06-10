local calendar_widget = require("widgets.calendar_widget")
local wibox = require("wibox")
local gears = require("gears")
local colorscheme = require("colorscheme")

local container_clock_widget = wibox.container

local clock_widget = wibox.widget({
	align = "center",
	valign = "center",
	font = "JetBrainsMonoNerdFont 11",
	widget = wibox.widget.textclock
})

container_clock_widget = {
	{
		{
			{
				{
					widget = clock_widget
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin,
			},
			shape = gears.shape.rounded_bar,
			fg = colorscheme.color["pink"],
			bg = colorscheme.color["surface0"],
			widget = wibox.container.background,
		},
		top = 4,
		bottom = 4,
		widget = wibox.container.margin,
	},
	spacing = 3,
	layout = wibox.layout.fixed.horizontal,
}

local cw = calendar_widget({
	radius = 0,
	theme = "dark"
})

clock_widget:connect_signal("button::press",
	function(_, _, _, button)
		if button == 1 then cw.toggle() end
	end)

return container_clock_widget
