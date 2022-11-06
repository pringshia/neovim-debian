vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent_background = true
vim.opt.background = "dark"

-- print(vim.inspect(packer_plugins))
if packer_plugins["tokyonight.nvim"] and packer_plugins["tokyonight.nvim"].loaded then
  vim.cmd("colorscheme tokyonight")
  -- vim.cmd("colorscheme kanagawa")
end
