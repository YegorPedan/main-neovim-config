vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>rx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>o", "o<Esc>0")
vim.keymap.set("n", "<leader>O", "O<Esc>0")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

function RunFile()
	-- Get the file extension of the current buffer
	local file_extension = vim.fn.expand("%:e")

	-- Check if it's a Python file
	if file_extension == "py" then
		vim.cmd("!python %")
	-- Check if it's a C file
	elseif file_extension == "c" then
		vim.cmd("!gcc -Wall -Wextra % -o %:r.out -std=c11 -g -O0 && ./%:r.out")
	else
		print("Unsupported file type.")
	end
end

-- Set the keymap for running the file
vim.keymap.set("n", "<leader>rp", "<cmd>lua RunFile()<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", ":close<CR>")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>")
-- vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<CR>")
