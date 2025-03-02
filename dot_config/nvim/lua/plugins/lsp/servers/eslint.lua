return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  autostart = false,
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = false,
    validate = "on",
  },
  handlers = {
    -- Suppress "No ESLint configuration found" warnings
    ["window/showMessageRequest"] = function(_, result)
      return result
    end,
  },
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
