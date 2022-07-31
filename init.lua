-- Load all my scripts
require("settings")
require("plugins")
require("keybindings")
require("autocmd")
require("startup")

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
