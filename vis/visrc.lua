require("vis")
-- config --
--
-- global
vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme gruvbox")
end)
-- per-window
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set tabwidth 2")
	vis:command("set relativenumbers true")
	vis:command("set autoindent true")
	vis:command("set showspaces false")
	vis:command("set showtabs false")
	vis:command("set expandtab on")
	vis:command("set shell /usr/bin/env sh")
	--vis:unmap(vis.modes.NORMAL, "p")
	vis:map(vis.modes.NORMAL, " p", '"+p')
	vis:map(vis.modes.NORMAL, " y", '"+y')
	vis:map(vis.modes.VISUAL, " y", '"+y')
	vis:map(vis.modes.NORMAL, "<C-s>",":w<Enter>")
	vis:map(vis.modes.NORMAL, " fm", function()
	  vis:command("open .")
		vis:feedkeys("<C-w>k")
		vis:command("wq!")
	end, "")
end)

-- plugins --
local cursormode = require("plugins/vis-cursormode")
cursormode.styles.normal = "fore:green,back:#ffffff"
cursormode.styles.insert = "fore:black,back:green"
cursormode.styles.replace = "fore:black,back:red,underlined"
-- modal
--local modal = require("plugins/vis-modal")
-- vis-autoclose
local autoclose = require("plugins/vis-autoclose")
-- colorizer
--local colorizer = require("plugins/vis-colorizer")
--colorizer.six = true
-- complete-filename
local completefilename = require("plugins/complete-filename")
-- vis-lspc
local lsp = require("plugins/vis-lspc")
lsp.ls_map.clangd = {
	formatting_options = {tabSize = 2, insertSpaces = false}
}
lsp.ls_map.lua = {
	name = "lua-language-server",
	cmd = "lua-language-server",
	settings = {
		Lua = { diagnostics = { globals = { "vis" } }, telemetry = { enable = false } },
	},
	formatting_options = { tabSize = 2, insertSpaces = true },
}
lsp.ls_map.qml = {
    name = "qml-language-server",
    cmd = 'qml-language-server',
    filetypes = { 'qml' },
}
