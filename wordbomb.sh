#!/usr/bin/env bash

WORD_LIST="$(dirname "$0")/data/words.txt"
IDEAL_LENGTH=6

main() {
  mkdir -p "$(dirname "$0")/data"

  if [[ ! -f "$WORD_LIST" ]]; then
    curl -s "https://raw.githubusercontent.com/first20hours/google-10000-english/refs/heads/master/google-10000-english-usa.txt" -o "$WORD_LIST"
  fi


  if [[ -z "$1" ]]; then
    echo "Usage: fuse <sequence>"
    exit 1
  fi

  grep -i "$1" "$WORD_LIST" | \
  awk -v ideal="$IDEAL_LENGTH" '
    {
      word = $0
      freq_rank = NR
      len = length(word)
      len_penalty = (len - ideal)^2
      score = freq_rank + len_penalty * 10
      print score, word
    }
  ' | \
  sort -n | \
  awk '{print $2}' | \
  head -3
}

main "$@"
