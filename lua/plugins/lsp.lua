return {
  {
    "mason-org/mason.nvim",
    config = function(_, opts)
      if opts.ensure_installed then
        vim.list_extend(opts.ensure_installed, { "csharp-ls" })
      else
        opts.ensure_installed = { "csharp-ls" }
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        csharp_ls = {},
      },
    },
  },
}
