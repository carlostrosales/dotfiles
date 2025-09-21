# Make a directory (including parents) and immediately enter it
mkdc() { mkdir -p "$1" && cd "$1"; }

# Unpack a tar archive
extract() { tar -xf "$1"; }

