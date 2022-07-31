local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")

dashboard.section.header.val = {
[[ _____               _         _     _]],
[[|_   _|__  _ __ ___ | | _____ (_) __| |]],
[[  | |/ _ \| '_ ` _ \| |/ / _ \| |/ _` |]],
[[  | | (_) | | | | | |   < (_) | | (_| |]],
[[  |_|\___/|_| |_| |_|_|\_\___/|_|\__,_|]]
}

alpha.setup(dashboard.config)
