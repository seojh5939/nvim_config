local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<cr>")

-- pane navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- clear search highlight
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- neoVim 종료
mapKey("<leader>q", ":qa<cr>") -- 모든 창 닫기
mapKey("<leader>Q", ":qa!<cr>") -- 강제 종료
mapKey("<leader>w", ":wqa<cr>") -- 저장하고 종료

mapKey("ya", ":%y<cr>") -- 파일 text 전체복사
mapKey("<C-s>", ":w") -- 파일 저장

-- nvim-ufo
-- za: 접기/펼치기
-- zM: 그룹 접기
-- zR: 그룹 펼치기
