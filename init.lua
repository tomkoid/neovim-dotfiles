local function is_module_available(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

-- Load all my scripts
-- require("plugin-manager")
require("remap")
require("settings")
require("plugins")
require("autocmd")
require("neovide")
require("colors")
if is_module_available("alpha") then
  require("dashboard")
end
if is_module_available("lualine") then
  require("lualine_conf")
end

if is_module_available("lspconfig") then
  require("lspconfig")
end

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

