-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'RRethy/base16-nvim',
    priority = 1000, -- Load before other plugins
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }
    end,
  },
  {
    'chipsenkbeil/org-roam.nvim',
    tag = '0.2.0',
    ft = { 'org' },
    dependencies = {
      'nvim-orgmode/orgmode',
    },
    config = function()
      require('org-roam').setup {
        directory = '~/org_roam_files',
      }
    end,
  },
}
