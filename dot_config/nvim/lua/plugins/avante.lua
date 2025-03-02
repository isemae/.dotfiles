return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "claude",
    -- auto_suggestions_provider = "groq",
    cursor_applying_provider = "claude",
    vendors = {
      groq = {
        __inherited_from = "openai",
        api_key_name = "GROQ_API_KEY",
        endpoint = "https://api.groq.com/openai/v1/",
        model = "llama-3.3-70b-versatile",
        max_tokens = 32768,
      },
      -- claude = {
      --   api_key_name = "ANTHROPIC_API_KEY",
      --   temperature = 1,
      --   max_tokens = 20000,
      --   endpoint = "https://api.anthropic.com",
      --   model = "claude-3-5-sonnet-20241022",
      --   thinking = {
      --     type = "enabled",
      --     budget_tokens = 16000,
      --   },
      -- },
    },
    behaviour = {
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
      -- auto_suggestions = true,
    },
    file_selector = {
      provicder = "fzf",
      provider_opts = {},
    },
    hints = { enabled = false },
    mappings = {
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
