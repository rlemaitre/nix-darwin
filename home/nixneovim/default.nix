{
  programs.nixneovim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    options = {
      relativenumber = true;
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      conceallevel = 2;
      termguicolors = true;
      background = "dark";
      signcolumn = "yes";
      backspace = "indent,eol,start";
      splitright = true;
      splitbelow = true;
      swapfile = false;
      clipboard = "unnamedplus";
    };
    augroups = {
      NvimTreeClose = {
        autocmds = [{
          event = "BufEnter";
          pattern = "NvimTree_*";
          luaCallback = ''
              local layout = vim.api.nvim_call_function("winlayout", {})
              if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
                vim.cmd("confirm quit")
              end
          '';
        }];
      };
      highlightOnYank = {
        autocmds = [{
          event = "TextYankPost";
          pattern = "*";
          luaCallback = ''
            vim.highlight.on_yank {
              higroup = (
                vim.fn['hlexists'] 'HighlightedyankRegion' > 0 and 'HighlightedyankRegion' or 'IncSearch'
              ),
              timeout = 200,
            }
          '';
        }];
      };
    };
    colorschemes = {
      nord = {
        enable = true;
        contrast = true;
        italic = true;
      };
    };
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    mappings = {
      normal = {
        "x" = "'\"_x'";
        # Increment/Decrement numbers
        "<leader>+" = {
          action = "\"<C-a>\"";
          desc = "Increment number";
        };
        "<leader>-" = {
          action = "\"<C-x>\"";
          desc = "Decrement number";
        };
        # Window management
        "<leader>wv" = {
          action = "\"<C-w>v\"";
          desc = "Split window vertically";
        };
        "<leader>wh" = {
          action = "\"<C-w>s\"";
          desc = "Split window horizontally";
        };
        "<leader>we" = {
          action = "\"<C-w>=\"";
          desc = "Make splits equal size";

        };
        "<leader>wx" = {
          action = "\"<cmd>close<CR>\"";
          desc = "Close current split";
        };
        # Tab Management
        "<leader>To" = {
          action = "\"<cmd>tabnew<CR>\"";
          desc = "Open new tab";
        };
        "<leader>Tx" = {
          action = "\"<cmd>tabclose<CR>\"";
          desc = "Close current tab";
        };
        "<leader>Tn" = {
          action = "\"<cmd>tabn<CR>\"";
          desc = "Go to next tab";
        };
        "<leader>Tp" = {
          action = "\"<cmd>tabp<CR>\"";
          desc = "Go to previous tab";
        };
        "<leader>Tf" = {
          action = "\"<cmd>tabnew %<CR>\"";
          desc = "Open current buffer in a new tab";
        };
        # nvim-tree
        "<leader>ee" = {
          action = "\"<cmd>NvimTreeToggle<CR>\"";
          desc = "Toggle file explorer";
        };
        "<leader>ef" = {
          action = "\"<cmd>NvimTreeFindFileToggle<CR>\"";
          desc = "Toggle file explorer on current file";
        };
        "<leader>ec" = {
          action = "\"<cmd>NvimTreeCollapse<CR>\"";
          desc = "Collapse file explorer";
        };
        "<leader>er" = {
          action = "\"<cmd>NvimTreeRefresh<CR>\"";
          desc = "Refresh file explorer";
        };
        # Terminal
        "<leader>tn" = {
          action = "\"<cmd>FloatermNew<CR>\"";
          desc = "Open new terminal";
        };
        "<leader>tj" = {
          action = "\"<cmd>FloatermPrev<CR>\"";
          desc = "Open previous terminal";
        };
        "<leader>tk" = {
          action = "\"<cmd>FloatermNext<CR>\"";
          desc = "Open next terminal";
        };
        "<leader>tt" = {
          action = "\"<cmd>FloatermToggle<CR>\"";
          desc = "Toggle terminal";
        };
        # NerdCommenter
        "<leader>/$" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'ToEOL')<CR>\"";
          desc = "Comment until end of line";
        };
        "<leader>ca" = {
          action = "\"<cmd>:Lspsaga code_action<CR>\"";
          desc = "Show code actions";
        };
        "<leader>chi" = {
          action = "\"<cmd:Lspsaga incoming_calls<CR>\"";
          desc = "Show incoming calls";
        };
        "<leader>cho" = {
          action = "\"<cmd:Lspsaga outgoing_calls<CR>\"";
          desc = "Show outgoing calls";
        };
        "<leader>cpd" = {
          action = "\"<cmd:Lspsaga peek_definition<CR>\"";
          desc = "Peek definition";
        };
        "<leader>cpt" = {
          action = "\"<cmd:Lspsaga peek_type_definition<CR>\"";
          desc = "Peek type definition";
        };
        "<leader>cgd" = {
          action = "\"<cmd:Lspsaga goto_definition<CR>\"";
          desc = "Go to definition";
        };
        "<leader>cgt" = {
          action = "\"<cmd:Lspsaga goto_type_definition<CR>\"";
          desc = "Go to type definition";
        };
        "<leader>cdp" = {
          action = "\"<cmd:Lspsaga diagnostic_jump_prev<CR>\"";
          desc = "Jump to previous diagnostic";
        };
        "<leader>cdn" = {
          action = "\"<cmd:Lspsaga diagnostic_jump_next<CR>\"";
          desc = "Jump to next diagnostic";
        };
        "<leader>cf" = {
          action = "\"<cmd>:Lspsaga finder<CR>\"";
          desc = "Show LP finder";
        };
        "<leader>cj" = {
          action = "\"<cmd>:Lspsaga hover_doc<CR>\"";
          desc = "Show hover documentation";
        };
        "<leader>co" = {
          action = "\"<cmd>:Lspsaga outline<CR>\"";
          desc = "Show code outline";
        };
        "<leader>cr" = {
          action = "\"<cmd>:Lspsaga rename<CR>\"";
          desc = "Rename symbol";
        };
        "<leader>gf" = {
          action = "\"<cmd>:Neogit kind=float<CR>\"";
          desc = "Open Neogit";
        };
        "<leader>gt" = {
          action = "\"<cmd>:Neogit kind=tab<CR>\"";
          desc = "Open Neogit in a new tab";
        };
        "<leader>gh" = {
          action = "\"<cmd>:Neogit kind=split<CR>\"";
          desc = "Open Neogit in an horizontal split";
        };
        "<leader>gv" = {
          action = "\"<cmd>:Neogit kind=vsplit<CR>\"";
          desc = "Open Neogit in an vertical split";
        };
        "<leader>gc" = {
          action = "\"<cmd>:Neogit commit<CR>\"";
          desc = "Commit changes";
        };
      };
      normalVisualOp = {
        # NerdCommenter
        "<leader>//" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Toggle')<CR>\"";
          desc = "Toggle comment";
        };
        "<leader>/c" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Comment')<CR>\"";
          desc = "Comment";
        };
        "<leader>/i" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Invert')<CR>\"";
          desc = "Invert comment";
        };
        "<leader>/m" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Minimal')<CR>\"";
          desc = "Minimal comment";
        };
        "<leader>/n" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Nested')<CR>\"";
          desc = "Nested comment";
        };
        "<leader>/y" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Yank')<CR>\"";
          desc = "Yank then comment";
        };
        "<leader>/u" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Uncomment')<CR>\"";
          desc = "Uncomment";
        };
        "<leader>/l" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'AlignLeft')<CR>\"";
          desc = "Left-aligned comment";
        };
        "<leader>/b" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'AlignBoth')<CR>\"";
          desc = "Left-and-right-aligned comment";
        };
        "<leader>s/" = {
          action = "\"<cmd>:call nerdcommenter#Comment('', 'Toggle')<CR>\"";
          desc = "Toggle comment";
        };
        "<leader>si" = {
          action = "function() require('nvim-toggler').toggle() end";
          desc = "Toggle word";
        };
        "<C-Right>" = {
          action = "\"<C-w>l\"";
          desc = "Go to right split";
        };
        "<C-Left>" = {
          action = "\"<C-w>l\"";
          desc = "Go to left split";
        };
        "<C-Up>" = {
          action = "\"<C-w>k\"";
          desc = "Go to up split";
        };
        "<C-Down>" = {
          action = "\"<C-w>l\"";
          desc = "Go to down split";
        };
      };
      insert = {
        # Handle correctly accentuated letters
        "<A-e>a" = { action = "\"á\""; silent = true; };
        "<A-e>e" = { action = "\"é\""; silent = true; };
        "<A-e>i" = { action = "\"í\""; silent = true; };
        "<A-e>o" = { action = "\"ó\""; silent = true; };
        "<A-e>u" = { action = "\"ú\""; silent = true; };
        "<A-e>A" = { action = "\"Á\""; silent = true; };
        "<A-e>E" = { action = "\"É\""; silent = true; };
        "<A-e>I" = { action = "\"Í\""; silent = true; };
        "<A-e>O" = { action = "\"Ó\""; silent = true; };
        "<A-e>U" = { action = "\"Ú\""; silent = true; };
        "<A-`>a" = { action = "\"á\""; silent = true; };
        "<A-`>e" = { action = "\"é\""; silent = true; };
        "<A-`>i" = { action = "\"í\""; silent = true; };
        "<A-`>o" = { action = "\"ó\""; silent = true; };
        "<A-`>u" = { action = "\"ú\""; silent = true; };
        "<A-`>A" = { action = "\"Á\""; silent = true; };
        "<A-`>E" = { action = "\"É\""; silent = true; };
        "<A-`>I" = { action = "\"Í\""; silent = true; };
        "<A-`>O" = { action = "\"Ó\""; silent = true; };
        "<A-`>U" = { action = "\"Ú\""; silent = true; };
        "<A-i>a" = { action = "\"â\""; silent = true; };
        "<A-i>e" = { action = "\"ê\""; silent = true; };
        "<A-i>i" = { action = "\"î\""; silent = true; };
        "<A-i>o" = { action = "\"ô\""; silent = true; };
        "<A-i>u" = { action = "\"û\""; silent = true; };
        "<A-i>A" = { action = "\"Â\""; silent = true; };
        "<A-i>E" = { action = "\"Ê\""; silent = true; };
        "<A-i>I" = { action = "\"Î\""; silent = true; };
        "<A-i>O" = { action = "\"Ô\""; silent = true; };
        "<A-i>U" = { action = "\"Û\""; silent = true; };
        "<A-u>a" = { action = "\"ä\""; silent = true; };
        "<A-u>e" = { action = "\"ë\""; silent = true; };
        "<A-u>i" = { action = "\"ï\""; silent = true; };
        "<A-u>o" = { action = "\"ö\""; silent = true; };
        "<A-u>u" = { action = "\"ü\""; silent = true; };
        "<A-u>A" = { action = "\"Ä\""; silent = true; };
        "<A-u>E" = { action = "\"Ë\""; silent = true; };
        "<A-u>I" = { action = "\"Ï\""; silent = true; };
        "<A-u>O" = { action = "\"Ö\""; silent = true; };
        "<A-u>U" = { action = "\"Ü\""; silent = true; };
      };
    };
    plugins = {
      bufferline = {
        enable = true;
        separatorStyle = "slant";
        showCloseIcon = true;
        showTabIndicators = true;
      };
      colorizer = {
        enable = true;
        userDefaultOptions = {
          mode = "background";
          AARRGGBB = true;
          RGB = true;
          RRGGBB = true;
          RRGGBBAA = true;
          css = true;
          cssFn = true;
          hlsFn = true;
          names = true;
          rgbFn = true;
          sass = {
            enable = true;
          };
          tailwind = true;
        };
      };
      comment-frame = {
        enable = true;
        autoIndent = true;
        keymap = "<leader>/f";
        multiline_keymap = "<leader>/m";
      };
      copilot = {
        enable = true;
      };
      diffview = {
        enable  = true;
      };
      floaterm = {
        enable = true;
        shell = "zsh";
        winType = "split";
      };
      gitsigns = {
        enable = true;
        currentLineBlame = true;
      };
      indent-blankline = {
        enable = true;
        indent = {
          char = "┊";
        };
      };
      lsp-lines = {
        enable = true;
        onlyCurrentLine = false;
      };
      lspconfig = {
        enable = true;
        servers = {
          bashls = {
            enable = true;
          };
          clangd = {
            enable = true;
          };
          cssls = {
            enable = true;
          };
          eslint = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
          hls = {
            enable = true;
          };
          html = {
            enable = true;
          };
          jsonls = {
            enable = true;
          };
          kotlin-language-server = {
            enable = true;
          };
          lua-language-server = {
            enable = true;
          };
          nil = {
            # Nix Language Server
            enable = true;
          };
          ocamllsp = {
            enable = true;
          };
          pyright = {
            enable = true;
          };
          rust-analyzer = {
            enable = true;
          };
          taplo = {
            # TOML Language Server
            enable = true;
          };
          terraform-ls = {
            enable = true;
          };
          typescript-language-server = {
            enable = true;
          };
          vuels = {
            enable = true;
          };
        };
      };
      lspkind = {
        enable = true;
        mode = "symbol_text";
      };
      lspsaga = {
        enable = true;
        beacon = {
          enable = true;
        };
        callhierarchy = {
          keys = {
            jump = "o";
            quit = "q";
            split = "i";
            tabe = "t";
            vsplit = "v";
          };
          showDetail = true;
        };
        codeAction = {
          extendGitsigns = true;
          keys = {
            exec = "<CR>";
            quit = "q";
          };
          numShortcut = true;
        };
        definition = {
          edit = "<C-c>o";
          quit = "q";
          split ="<C-c>i";
          vsplit = "<C-c>v";
        };
        diagnostic = {
          jumpNumShortcut = true;
          keys = {
            execAction = "o";
            expandOrJump = "<CR>";
            quit = "q";
            quitInShow = ["q" "<ESC>"];
          };
          showCodeAction = true;
          showSource = true;
        };
        finder = {
          keys = {
            closeInPreview = "<ESC>";
            expandOrJump = "o";
            jumpTo = "p";
            quit = ["q" "<ESC>"];
            split = "i";
            tabe = "t";
            tabnew = "r";
            vsplit = "v";
          };
        };
        hover = {
          openBrowser = "!chrome";
          openLink = "gx";
        };
        lightbulb = {
          enable = true;
          enableInInsert = true;
          sign = true;
          virtualText = true;
        };
        outline = {
          autoClose = true;
          autoPreview = true;
          autoRefresh = true;
          autoResize = false;
          closeAfterJump = false;
          keys = {
            expandOrJump = "o";
            quit = "q";
          };
          winPosition = "right";
        };
        preview = {
          linesAbove = 0;
          linesBelow = 10;
        };
        rename = {
          exec = "<CR>";
          inSelect = true;
          quit = "<C-c>";
        };
        requestTimeout = 2000;
        scrollPreview = {
          scrollDown = "<C-f>";
          scrollUp = "<C-b>";
        };
        symbolInWinbar = {
          enable = true;
          colorMode = true;
          separator = " › ";
          showFile = true;
        };
      };
      lualine = {
        enable = true;
        theme = "nord";
      };
      markdown-preview = {
        enable = true;
      };
      neogit = {
        enable = true;
        kind = "floating";
      };
      nerdcommenter = {
        enable = true;
        defaultAlign = "left";
        createDefaultMappings = 0;
        spaceDelims = 1;
      };
      nvim-autopairs = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
        completion = {
          completeopt = "menu,menuone,preview,noselect";
        };
        formatting = {
          format = "require('lspkind').cmp_format({mode = 'symbol', maxwidth = { menu = 50, abbr = 50, }, ellipsis_char = '...', show_labelDetails = true,})";
        };
        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<Up>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<PageUp>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<PageDown>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<LeftMouse>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<Esc>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
        snippet = {
          luasnip = {
            enable = true;
          };
        };
        sources = {
          buffer = {
            enable = true;
          };
          conventionalcommits = {
            enable = true;
          };
          copilot = {
            enable = true;
          };
          emoji = {
            enable = true;
          };
          git = {
            enable = true;
          };
          luasnip = {
            enable = true;
          };
          nvim_lsp = {
            enable = true;
          };
          path = {
            enable = true;
          };
        };
      };
      nvim-toggler = {
        enable = true;
        removeDefaultKeybinds = true;
      };
      nvim-tree = {
        enable = true;
        diagnostics = { enable = true; };
        filters = {
          custom = [
            ".DS_Store"
            "^.git$"
          ];
          dotfiles = false;
        };
        openOnTab = true;
        syncRootWithCwd = true;
        updateFocusedFile = { enable = true; };
        git = {
          enable = true;
          ignore = false;
        };
        view = {
          relativenumber = true;
          number = true;
          # width = "50";
        };
        extraConfig = {
          renderer = {
            full_name = true;
            group_empty = true;
            indent_markers = { enable = true; };
            special_files = [
              "Cargo.toml"
              "build.sbt"
              "Makefile"
              "README.md"
              "README.adoc"
              "README.org"
              "readme.md"
              "readme.adoc"
              "readme.org"
              "package.json"
            ];
            icons = {
              git_placement = "signcolumn";
              show = {
                file = true;
                folder = true;
                folder_arrow = true;
                git = true;
              };
              glyphs = {
                default = "";
                symlink = "";
                bookmark = "󰆤";
                modified = "●";
                folder = {
                  arrow_closed = "";
                  arrow_open = "";
                  default = "";
                  open = "";
                  empty = "";
                  empty_open = "";
                  symlink = "";
                  symlink_open = "";
                };
                git = {
                  unstaged = "✗";
                  staged = "✓";
                  unmerged = "";
                  renamed = "➜";
                  untracked = "★";
                  deleted = "";
                  ignored = "◌";
                };
              };
            };
          };

        };
      };
      project-nvim = {
        enable = true;
        detectionMethods = [
          "lsp"
          "pattern"
        ];
        patterns = [
			    ".git"
			    "package.json"
			    ".terraform"
			    "go.mod"
			    "requirements.yml"
			    "pyrightconfig.json"
			    "pyproject.toml"
			    "build.sbt"
			    "Cargo.toml"
			    "pom.xml"
			    "gradle.properties"
			    "build.gradle"
			    "settings.gradle"
			    "build.sc"
        ];
      };
      surround = {
        enable = true;
      };
      telescope = {
        enable = true;
        extensions = {
          manix = { enable = true; };
          mediaFiles = { enable = true; };
        };
      };
      todo-comments = { enable = true; };
      treesitter = {
        enable = true;
        indent = true;
        installAllGrammars = true;
      };
      treesitter-context = { enable = true; };
      trouble = { enable = true; };
      which-key = {
        enable = true;
        groups = {
          normal = {
            "<leader>/" = "Comment line";
            "<leader>c" = "Code actions";
            "<leader>cd" = "Diagnostics";
            "<leader>cg" = "Go to definition";
            "<leader>ch" = "Call Hierarchy";
            "<leader>cp" = "Peek definition";
            "<leader>e" = "File Explorer";
            "<leader>g" = "Git";
            "<leader>s" = "Switch things";
            "<leader>t" = "Terminal";
            "<leader>T" = "Tab Management";
            "<leader>w" = "Window Management";
          };
        };
      };
    };
  };
}
