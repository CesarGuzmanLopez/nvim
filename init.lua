vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

package.path =  package.path .. ";".."~/.config/nvim/lua/plugins/config/?.lua"
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.g.copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
vim.g.lastplace_open_folds = 0
vim.g.copilot_assume_mapped = true
vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.termguicolors = true
