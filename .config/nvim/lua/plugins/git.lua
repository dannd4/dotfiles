---@type LazySpec
return {
  {
    "linrongbin16/gitlinker.nvim",
    opts = {
      router = {
        browse = {
          ["^git%.parcelperform%.com"] = "https://git.parcelperform.com/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.CURRENT_BRANCH}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },
      },
    },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
