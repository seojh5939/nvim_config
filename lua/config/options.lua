local opt = vim.opt

-- tab/indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- visual
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showtabline = 2 -- 항상 탭바 표시 (0: 숨김, 1: 2개 이상일때, 2: 항상)

-- etc
opt.encoding = "UTF-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8,euc-kr,cp949"
opt.cmdheight = 1
opt.scrolloff = 10
opt.mouse:append("a")
opt.clipboard = "unnamedplus"
-- tab
opt.termguicolors = true
