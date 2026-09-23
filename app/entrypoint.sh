#!/bin/sh
set -eu

hostname_value="${BACKEND_HOSTNAME:-$(hostname)}"
printf 'window.BACKEND_HOSTNAME = "%s";\n' "$(printf '%s' "$hostname_value" | sed 's/\\/\\\\/g; s/"/\\"/g')" > /usr/share/nginx/html/backend-info.js

exec nginx -g 'daemon off;'
