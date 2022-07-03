
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end



nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = { "l", "<CR>" }, cb = nvim_tree_config.nvim_tree_callback "edit" },
        { key = "h", cb = nvim_tree_config.nvim_tree_callback "close_node" },
      },
    },
    width = 40,
    number = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    -- dotfiles = true,
  },
})

