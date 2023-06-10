local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local colorscheme = require("colorscheme")

local container_volume_widget = wibox.container

local volume_widget = wibox.widget({
    align = "center",
    valign = "center",
    font = "JetBrainsMonoNerdFont 11",
    widget = wibox.widget.textbox
})

local function update_volume_widget(widget)
    awful.spawn.easy_async("pactl get-sink-mute @DEFAULT_SINK@", function(stdout1)
        local muted = stdout1:match("yes")
        if muted == "yes" then
            widget.text = "󰝟" .. " " .. "muted"
        else
            awful.spawn.easy_async("pactl get-sink-volume @DEFAULT_SINK@", function(stdout2)
                local volume = stdout2:match("(%d?%d?%d)%%")
                widget.text = "󰕾" .. " " .. volume .. "%"
            end)
        end
    end)
end

update_volume_widget(volume_widget)

container_volume_widget = {
    {
        {
            {
                {
                    widget = volume_widget,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin,
            },
            shape = gears.shape.rounded_bar,
            fg = colorscheme.color["mauve"],
            bg = colorscheme.color["surface0"],
            widget = wibox.container.background,
            buttons = gears.table.join(
                awful.button({}, 1, nil, function()
                    awful.spawn("pavucontrol")
                end)
            ),
        },
        top = 4,
        bottom = 4,
        widget = wibox.container.margin,
    },
    spacing = 5,
    layout = wibox.layout.fixed.horizontal,
}

return {
    volume_widget = volume_widget,
    container_volume_widget = container_volume_widget,
    update_volume_widget = update_volume_widget
}

