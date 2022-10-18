require("code_runner").setup({
	focus = false,
	filetype = {
		c = "cd $dir && gcc $fileName -o $fileNameWithoutExt -g && $dir/$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt -g && $dir/$fileNameWithoutExt",
		go = "cd $dir && go run $fileName",
		python = "cd $dir && python3 $fileName",
	},
})
