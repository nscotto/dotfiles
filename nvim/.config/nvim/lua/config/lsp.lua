return {
  servers = {
    clangd = {
      -- Disable clangd's default formatting (use .clang-format)
      capabilities = {
        textDocument = {
          formatting = {
            dynamicRegistration = true,
          },
        },
      },
      cmd = {
        "clangd",
        "--style=file", -- Critical: Forces use of .clang-format
        "--fallback-style=none", -- Critical: Forces use of .clang-format
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
      },
    },
  },
}
