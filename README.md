# wordbomb

A CLI tool that suggests the best words to play for a given letter sequence in [WordBomb](https://wordbomb.io/).

## Usage

```bash
./wordbomb.sh <sequence>
```

```bash
./wordbomb.sh str   # → street, strong, string
./wordbomb.sh tion  # → action, section, options
./wordbomb.sh ph    # → photos, phones, phone
```

Returns the top 3 words ranked by a combination of popularity and ideal word length.

## Setup

```bash
git clone https://github.com/mano-coder/wordbomb
cd wordbomb
chmod +x wordbomb.sh
./wordbomb.sh <sequence>
```

The word list is downloaded automatically on first run.

## How it works

- Filters a 10k frequency-ranked word list for words containing the sequence
- Scores each match by `frequency_rank + length_penalty` where length penalty favors ~6 letter words
- Returns the top 3 by score

## Dependencies

`bash`, `grep`, `awk`, `sort`, `curl` — all standard on macOS and Linux.
