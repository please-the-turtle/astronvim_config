return {
  {
    'barrett-ruth/live-server.nvim',
    build = 'yarn global add live-server',
    ft = "html",    
    config = function()
      require("live-server").setup()
      end,
  }
}
