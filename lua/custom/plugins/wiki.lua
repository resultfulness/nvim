return {
  'vimwiki/vimwiki',
  init = function ()
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_root = vim.fn.expand('~/personal/notes')
    vim.g.vimwiki_list = {
      {
        path = "~/personal/notes",
        syntax = "markdown",
        ext = ".md",
      },
    }
  end
}
