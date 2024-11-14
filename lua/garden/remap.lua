vim.opt.guicursor = ""
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



--enter relief
vim.keymap.set("i", "<C-g>", "<CR>")
vim.keymap.set("n", "<C-g>", "<CR>")

--arrows go away
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

vim.keymap.set("v", "<Up>", "<nop>")
vim.keymap.set("v", "<Down>", "<nop>")
vim.keymap.set("v", "<Left>", "<nop>")
vim.keymap.set("v", "<Right>", "<nop>")

-- vim.keymap.set("n", "<Backspace>", "<C-h>")



--
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", "<cmd>Prettier<CR>")
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>n", [[/<C-r><C-w><CR>]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- theme in styled components
vim.keymap.set("n", "<leader>th", "i${({theme})=>theme.}<Esc>i")

vim.keymap.set("n", "<leader>dxx", "odisplay:flex;<CR>align-items:center;<CR>justify-content:center;<CR><Esc>")

vim.keymap.set(
  "n",
  "<leader>dxc",
  "odisplay:flex;<CR>flex-direction:column;<CR>align-items:center;<CR>justify-content:center;<CR><Esc>"
)

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

--terminal

vim.keymap.set("n", "<leader>ett", "<C-w><C-v><C-w><C-l>:term<CR>a")

--Escaping terminal mode
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><C-w><C-h>', { noremap = true, silent = true })


vim.keymap.set("n", "<leader>pcc", ":cdo s/console.log(.*)//gc<CR>")

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
