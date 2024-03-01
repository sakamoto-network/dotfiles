return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies =   {
    "microsoft/vscode-js-debug",
    -- After install, build it and rename the dist directory to out
    build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    version = "1.*",
  },

  opts = {
    debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  }

}
