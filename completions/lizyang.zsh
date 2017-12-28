if [[ ! -o interactive ]]; then
    return
fi

compctl -K _lizyang lizyang

_lizyang() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(lizyang commands)"
  else
    completions="$(lizyang completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
