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
require("settings")
require("plugins")
require("keybindings")
require("autocmd")
require("neovide")
if is_module_available("alpha") then
  require("dashboard")
end
if is_module_available("lualine") then
  require("lualine_conf")
end

if is_module_available("lspconfig") then
  require("lspconfig").sumneko_lua.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"},
        },
      },
    },
  })
end


---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
