local mapKey = require("utils.keyMapper").mapKey

return {
	"vimwiki/vimwiki",
	-- Vimwiki는 설정이 미리 로드되어야 하므로 'init' 함수를 사용하는 것이 좋습니다.
	init = function()
		-- ********** 기본 설정 **********

		-- vim.g.vimwiki_list: 위키 목록을 정의합니다.
		-- 여러 개의 위키를 관리할 수 있으며, 여기서는 가장 기본적인 1개만 설정합니다.
		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki", -- 위키 파일이 저장될 기본 경로 (홈 디렉토리에 'vimwiki' 폴더)
				syntax = "default", -- 마크업 문법 ('default', 'markdown', 'mediawiki' 중 선택)
				ext = ".wiki", -- 파일 확장자
			},
			-- 만약 Markdown 문법을 선호한다면:
			-- path = '~/Notes/MyWiki',
			-- syntax = 'markdown',
			-- ext = '.md',
		}

		-- ********** 추가 설정 (선택 사항) **********

		-- 일기장(Diary) 기능 활성화 및 설정
		vim.g.vimwiki_diary_link_format = "%Y-%m-%d" -- 일기장 파일 이름 형식 (예: 2025-11-11.wiki)
		vim.g.vimwiki_diary_index = "1" -- 첫 번째 위키 목록(index 1)을 일기장으로 사용
	end,

	-- `<Leader>ww`와 같은 키맵 사용 시에만 플러그인이 로드되도록 lazy-loading을 설정할 수 있습니다.
	mapKey("<leader>ww", ":VimwikiIndex<cr>"),
	mapKey("<leader>wi", ":VimwikiDiaryIndex<cr>"),
	mapKey("<leader>w<leader>w", ":VimwikiDiary<cr>"),
	mapKey("<leader>wd", ":VimwikiDeleteLink<cr>"),
	mapKey("<leader>wt", ":VimwikiTable<cr>"),
	mapKey("<cr>", ":VimwikiFollowLink<cr>"),
	mapKey("<bs>", ":VimwikiBack<cr>"),
}
