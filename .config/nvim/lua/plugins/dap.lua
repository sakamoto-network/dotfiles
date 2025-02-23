return {
  'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio", { "theHamsta/nvim-dap-virtual-text", opts = {} }},
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    local remap = require("keymaps")
    local nnoremap = remap.nnoremap

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    nnoremap("<leader>dc", function()
      dap.close()
    end)
    nnoremap("<leader>dn", function()
      dap.continue()
    end)
    nnoremap("<leader>so",
    function()
      if vim.fn.filereadable(".vscode/launch.json") then
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.load_launchjs(nil, {
          ["pwa-node"] = js_based_languages,
          ["chrome"] = js_based_languages,
          ["pwa-chrome"] = js_based_languages,
        })
      end
      require("dap").continue()
    end)
    nnoremap("<leader>si", function()
      dap.step_into()
    end)
    nnoremap("<leader>ss", function()
      dap.step_out()
    end)
    nnoremap("<leader>db", function()
      dap.toggle_breakpoint()
    end)
    nnoremap("<leader>dB", function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end)
    nnoremap("<leader>rc", function()
      dap.run_to_cursor()
    end)

    dap.adapters.lldb = {
      type = 'server',
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = os.getenv('HOME') .. '/codelldb/extension/adapter/codelldb',
        args = {"--port", "${port}"},
      }
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
      -- Debug nodejs processes (make sure to add --inspect when you run the process)
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Start Chrome with \"localhost\"",
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
      }
    }

  end
}
