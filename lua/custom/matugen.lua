local M = {}

local function source_matugen()
  local matugen_path = os.getenv 'HOME' .. '/.config/nvim/matugen.lua'
  local file, err = io.open(matugen_path, 'r')

  if err ~= nil then
    vim.cmd 'colorscheme catppuccin-mocha'
    vim.notify('Matugen theme not found. Run: matugen image /path/to/wallpaper', vim.log.levels.INFO)
  else
    io.close(file)
    dofile(matugen_path)
  end
end

local function reload_matugen_theme()
  source_matugen()

  -- Reload lualine if needed
  local lualine_ok, lualine = pcall(require, 'lualine')
  if lualine_ok then
    lualine.setup()
  end

  vim.api.nvim_set_hl(0, 'Comment', { italic = true })
end

function M.setup()
  -- Register autocmd for SIGUSR1 signal
  vim.api.nvim_create_autocmd('Signal', {
    pattern = 'SIGUSR1',
    callback = reload_matugen_theme,
  })

  -- Load theme on startup
  reload_matugen_theme()
end

return M
