return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        }
      }
    },
    config = function()
      -- require("lspconfig").lua_ls.setup {}
      vim.lsp.config("lua_ls", {})
      -- vim.lsp.config("",{})
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = args.buf, id = client.id
                })
              end
            })
          end
        end,
      })
      vim.lsp.config("pylsp", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("ts_ls",{})
      vim.lsp.config("clangd", {})
      vim.lsp.config("rust_analyzer", {
        filetypes = { 'rust', 'toml' },

        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = true,
            }
          }
        }
      })
      vim.lsp.enable("rust_analyzer")
      -- vim.lsp.enable("clangd")
      vim.lsp.enable("pylsp")
      vim.lsp.enable("cssls")
      vim.lsp.enable("tsls")
      -- require("lspconfig").pylsp.setup {}
      -- require("lspconfig").cssls.setup {}
      -- require 'lspconfig'.clangd.setup {}
      -- require 'lspconfig'.rust_analyzer.setup {}
    end,
  }
}
