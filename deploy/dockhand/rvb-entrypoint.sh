#!/bin/sh
set -eu

theme_dir="${GLPI_VAR_DIR:-/var/glpi/files}/_themes"
mkdir -p "$theme_dir"
cp /opt/rvb/rvb-theme.scss "$theme_dir/rvb.scss"

exec /opt/glpi/entrypoint.sh "$@"
