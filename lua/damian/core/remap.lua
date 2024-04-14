vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "<leader>sy", [["*y]])
vim.keymap.set("n", "<leader>sp", [["*p]])
vim.keymap.set("v", "<leader>sp", [["*p]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "<leader><leader>", "<cmd>Prettier<CR>")

-- vim.keymap.set("n", "<C-a>", "gg<s-v>G")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-z>", "<nop>")
-- vim.keymap.set("n", "ZZ", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--vim.keymap.set("n", "<leader>f", "<cmd>Prettier<CR>")
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
end)

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>n", [[/<C-r><C-w><CR>]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- theme in styled components

vim.keymap.set("n", "<leader>th", function()
  local theme_text = "${({theme})=>theme.}"
  vim.api.nvim_put({ theme_text }, "", true, true)
  -- vim.cmd('startinsert!')
  --  vim.fn.cursor(vim.fn.line('.'), vim.fn.col('.') - 1)
end, { silent = true }, { noremap = true })

vim.keymap.set("n", "<leader>dxx", function()
  local display_flex = "display:flex; align-items:center; justify-content:center;"
  vim.api.nvim_put({ display_flex }, "", true, true)
  -- vim.cmd('startinsert!')
  --  vim.fn.cursor(vim.fn.line('.'), vim.fn.col('.') - 1)
end, { silent = true }, { noremap = true })

vim.keymap.set("n", "<leader>dxc", function()
  local display_flex = "display:flex; flex-direction:column; align-items:center; justify-content:center;"
  vim.api.nvim_put({ display_flex }, "", true, true)
  -- vim.cmd('startinsert!')
  --  vim.fn.cursor(vim.fn.line('.'), vim.fn.col('.') - 1)
end, { silent = true }, { noremap = true })

local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set("n", "<Leader>qt", toggle_quickfix, { desc = "Toggle Quickfix Window" })
