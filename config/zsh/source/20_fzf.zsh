eval "$(fzf --zsh)"

zstyle ':fzf-tab:*' use-fzf-default-opts yes

export FZF_DEFAULT_OPTS=" \
  --reverse \
  --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
  --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
  --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
  --color=selected-bg:#51576d \
  --multi"

_fzf_complete_pnpm() {
  _fzf_complete --delimiter '\s\s+' --accept-nth=1 -- "$@" < <(
    jq -r ".scripts | to_entries[] | [.key, .value] | @tsv" ./package.json | column -t -s $'\t' 
  )
}
