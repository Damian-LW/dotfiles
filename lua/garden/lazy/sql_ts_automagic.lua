-- -- local function debug_treesitter()
-- -- 	print("Available parsers:", vim.inspect(vim.api.nvim_get_runtime_file("parser/*.so", true)))
-- -- 	print("Typescript parser status:", vim.treesitter.language.require_language("typescript", nil, true))
-- -- end
-- --
-- -- debug_treesitter()
--
-- local embedded_sql = vim.treesitter.parse_query(
-- 	"typescript",
-- 	[[
--    (await_expression
--      (call_expression
--        function: (member_expression
--          object: (identifier) @object (#eq? @object "db")
--          property: (property_identifier) @property (#match? @property "sync")
--        )
--    arguments: (arguments
--      (template_string
--        (string_fragment) @sql_string
--          )
--        )
--      )
--    )
--    ]]
-- )
--
-- local get_root = function(bufnr)
-- 	local parser = vim.treesitter.get_parser(bufnr, "typescript", {})
-- 	local tree = parser:parse()[1]
-- 	return tree:root()
-- end
--
-- local format_sql = function(bufnr)
-- 	bufnr = bufnr or vim.api.nvim_get_current_buf()
-- 	if vim.bo[bufnr].filetype ~= "tsx" then
-- 		vim.notify("Can only be used in tsx")
-- 		return
-- 	end
-- 	local root = get_root(bufnr)
-- 	local changes = {}
--
-- 	for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
-- 		local name = embedded_sql.captures[id]
-- 		if name == "sql_string" then
-- 			local range = { node:range() }
-- 			local indentation = string.rep(" ", range[2])
--
-- 			local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr))
--
-- 			for idx, line in ipairs(formatted) do
-- 				formatted[idx] = indentation .. line
-- 			end
--
-- 			table.insert(changes, 1, {
-- 				start = range[1] + 1,
-- 				final = range[3],
-- 				formatted = formatted,
-- 			})
-- 		end
-- 	end
--
-- 	for _, change in ipairs(changes) do
-- 		vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
-- 	end
-- end
--
-- vim.api.nvim_create_user_command("SqlMagic", function()
-- 	format_sql()
-- end, {})
-- --

-- local embedded_sql = vim.treesitter.query.parse(
-- 	"typescript",
-- 	[[
--     (await_expression
--       (call_expression
--         function: (member_expression
--           object: (identifier) @object (#eq? @object "db")
--           property: (property_identifier) @property (#match? @property "sync")
--         )
--     arguments: (arguments
--       (template_string
--         (string_fragment) @sql_string
--           )
--         )
--       )
--     )
--     ]]
-- )

-- local get_root = function(bufnr)
-- 	local parser = vim.treesitter.get_parser(bufnr, "typescript", {})
-- 	local tree = parser:parse()[1]
-- 	return tree:root()
-- end

-- local format_sql = function(bufnr)
-- 	print("unaoeuaou")
-- 	-- bufnr = bufnr or vim.api.nvim_get_current_buf()
-- 	-- print("bufnr", bufnr)
-- 	-- if vim.bo[bufnr].filetype ~= "typescript" then
-- 	-- 	vim.notify("Can only be used in typescript")
-- 	-- 	return
-- 	-- end
-- 	-- local root = get_root(bufnr)
-- 	-- local changes = {}
-- 	--
-- 	-- for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
-- 	-- 	local name = embedded_sql.captures[id]
-- 	-- 	if name == "sql_string" then
-- 	-- 		local range = { node:range() }
-- 	-- 		local indentation = string.rep(" ", range[2])
-- 	--
-- 	-- 		local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr))
-- 	--
-- 	-- 		for idx, line in ipairs(formatted) do
-- 	-- 			formatted[idx] = indentation .. line
-- 	-- 		end
-- 	--
-- 	-- 		table.insert(changes, 1, {
-- 	-- 			start = range[1] + 1,
-- 	-- 			final = range[3],
-- 	-- 			formatted = formatted,
-- 	-- 		})
-- 	-- 	end
-- 	-- end
-- 	--
-- 	-- for _, change in ipairs(changes) do
-- 	-- 	vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
-- 	-- end
-- end

-- vim.api.nvim_create_user_command("SqlMagic", function()
-- 	print("aoue")
-- end, {})
local M = {}
local queries = {
	typescript = [[
((template_string) @sql)
    ]],
}

local get_root = function(bufnr)
	local parser = vim.treesitter.get_parser()
	print("parser", parser)
	-- local tree = parser:parse()[1]
	-- return tree:root()
end

get_root(vim.api.nvim_get_current_buf())

M.format_dat_sql = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.bo[bufnr].filetype ~= "typescript" then
		vim.notify("Can only be used in typescript")
		return
	end
	-- local root = get_root(bufnr)
	-- local changes = {}

	-- local parser = vim.treesitter.get_parser()
	-- local tree = parser:parse()[1]
	-- local root = tree:root()
	-- local lang = parser:lang()
	--
	-- local query = queries[lang]
	-- local embedded_sql = vim.treesitter.query.parse(lang, query)

	--	get_root(bufnr)
end

vim.api.nvim_create_user_command("SqlMagic", function()
	M.format_dat_sql()
end, {})

return M
