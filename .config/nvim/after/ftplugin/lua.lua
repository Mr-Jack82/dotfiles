-- Set options to open require with gf
vim.opt_local.include = [[\v<((do|load)file|require)\s*\(?['"]\zs[^'"]+\ze['"]]
vim.opt_local.includeexpr = "v:lua.find_required_path(v:fname)"
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
