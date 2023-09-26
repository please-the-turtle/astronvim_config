return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
    require('dap-go').setup {
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      -- dap_configurations = {
      --   {
      --     -- Must be "go" or it will be ignored by the plugin
      --     type = "go",
      --     name = "DLV (Arguments)",
      --     request = "launch",
      --     program = vim.api.nvim_buf_get_name(0),
      --     args = {},
      --   },      
      -- },

      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = os.getenv('HOME') .. "/go/bin/dlv",
        
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,

        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        
        -- additional args to pass to dlv
        args = {'--log-dest', '/home/alexey/Documents/dlv-log'},

        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        -- build_flags = "",

        -- Path to the program folder (or any go file within that folder)
        -- when in debug or test mode,
        -- and to the pre-built binary file to 
        -- debug in exec mode. If it is not an absolute path, 
        -- the extension interpretes it as a workspace relative path.
        -- program = vim.api.nvim_buf_get_name(0) 
      },
    }
    end
  },

  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      vim.cmd("autocmd FileType go nnoremap <buffer> <Leader>lk <Cmd>GoDoc<CR>")
      vim.cmd("autocmd FileType go nnoremap <buffer> <Leader>le <Cmd>GoIfErr<CR>")
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
