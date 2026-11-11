#!/bin/sh
set -eu

theme_dir="${GLPI_VAR_DIR:-/var/glpi/files}/_themes"
mkdir -p "$theme_dir"
rm -f "$theme_dir/rvb.scss"
cp /opt/rvb/rvb-theme.css "$theme_dir/rvb.css"

exec /opt/glpi/entrypoint.sh "$@"
