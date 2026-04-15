require("dbee").setup({
  sources = {
    -- Connections saved interactively persist here
    require("dbee.sources").FileSource:new(
      vim.fn.stdpath("cache") .. "/dbee/persistence.json"
    ),
    -- Or load from env variable:
    -- require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
  },
})

vim.keymap.set("n", "<leader>db", require("dbee").toggle, { desc = "Toggle [D]B[ee]" })
