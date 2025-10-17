local keyMapper = require('utils.keyMapper').mapKey

return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "ts_ls", "kotlin_language_server" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
          virtual_text = true,  -- 코드 옆에 에러/경고 표시
          signs = true,         -- 왼쪽 sign column에 표시
          underline = true,     -- 코드에 밑줄 표시
          update_in_insert = false,  -- insert 모드에서는 업데이트 안함
          severity_sort = true,  -- 심각도 순으로 정렬
        globals = {"vim"}
      })
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('kotlin_language_server')
      vim.lsp.enable('sourcekit')

      keyMapper('K', vim.lsp.buf.hover)
      keyMapper('gd', vim.lsp.buf.definition)
      keyMapper('<leader>ca', vim.lsp.buf.code_action)
    end
  }
}
