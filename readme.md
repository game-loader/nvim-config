# Neovim 配置

这次决定从头开始打造自己的编辑器,其中所有的功能都是自行组装

使用的插件列表如下

| name                            | decription                                                          |
|---------------------------------|---------------------------------------------------------------------|
| nvim-telescope/telescope.nvim   | 查找,过滤,预览文件                                                  |
| kdheepak/lazygit.nvim           | 与lazygit进行集成,需要自行安装lazygit,用法可参考lazygit的github页面 |
| nvim-treesitter/nvim-treesitter | 高性能的语法高亮                                                    |
| folke/which-key.nvim            | 快捷键弹窗查看和更方便的快捷键设置                                  |
| akinsho/bufferline.nvim         | 顶部标签栏                                                          |
| hrsh7th/nvim-cmp                | 优秀的补全插件                                                      |
| hrsh7th/cmp-path                | 补全路径                                                            |
| hrsh7th/cmp-buffer              | 缓冲区内重复单词补全                                                |
| hrsh7th/cmp-nvim-lsp            | 补全与lsp的集成                                                     |
| kyazdani42/nvim-tree.lua        | 文件查看器,不用多说                                                 |
| numToStr/Comment.nvim           | 强大的注释插件                                                      |
| windwp/nvim-autopairs           | 括号自动补全                                                        |
| ahmedkhalf/project.nvim         | 出色的项目管理工具,可与telescope集成                                |
| jose-elias-alvarez/null-ls.nvim | 代码格式化工具,还可提供其他与lsp集成的功能                          |
| neovim/nvim-lspconfig           | 快速的lsp配置工具                                                   |
| williamboman/mason.nvim         | lsp-installer作者的新作,方便管理lsp dap linter formatter等          |
| rafamadriz/friendly-snippets    | 自定义各种语言的一些代码模板                                        |
| nvim-lualine/lualine.nvim       | 底部状态栏                                                          |
| wbthomason/packer.nvim          | 大名鼎鼎的包管理工具                                                |
| rcarriga/nvim-notify            | 现代化的消息弹窗提示                                                |
| akinsho/toggleterm.nvim         | 优秀的nvim集成终端                                                  |
| mfussenegger/nvim-dap           | neovim 的dap实现                                                    |


## 快捷键
 \<leader>键被配置为空格
### 常用
| key            | function                                  |
|----------------|-------------------------------------------|
| T              | 打开nvim-tree文件浏览                     |
| f              | 打开telescope进行文件查找                 |
| Ctrl-h         | 切换到左标签栏                            |
| Ctrl-l         | 切换到右标签栏                            |
| \<leader>q     | 退出neovim                                |
| \<leader>s     | 保存当前文件                              |
| \<leader>S     | 保存所有文件                              |
| \<leader><tab> | 切换回上一个buffer,用于两buffer间来回切换 |
| ,              | 运行当前文件代码,需要自行配置各种语言     |

### Packer 
| key         | function               |
|-------------|------------------------|
| \<leader>pi | 包同步PackerSync       |
| \<leader>pc | 包清理PackerClean      |
| \<leader>ps | 包状态查看PackerStatus |

### lsp
| key         | function                        |
|-------------|---------------------------------|
| \<leader>li | 安装当前文件语言对应的lsp服务   |
| \<leader>lI | 打开Mason安装lsp dap 等任意服务 |
| \<leader>ll | 打开Mason查看安装的服务         |
| \<leader>lu | 卸载当前语言对应的lsp           |

### git
| key        | function        |
|------------|-----------------|
| \<leader>g | 打开lazygit界面 |

### dap
| key         | function  |
|-------------|-----------|
| \<leader>db | 打断点    |
| \<leader>de | 停止debug |
| \<leader>dc | 清理断点  |
| \<leader>dr | 开始debug |
| \<Ctrl-n>   | step into |
| \<Ctrl-o>   | step over |

### buffer
| key         | function       |
|-------------|----------------|
| \<leader>bb | 打开某个buffer |
| \<leader>bk | 关闭当前buffer |

## 问题

### 根据文件类型启动某些功能
可以在ftplugin文件夹中放入对应文件类型的lua文件,如markdown.lua对应markdown文件.写入要执行的命令即可.例子可见ftplugin/markdown中启动markdown table mode




