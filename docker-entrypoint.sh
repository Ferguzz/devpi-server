#!/bin/bash

supervisord -c /etc/supervisor/supervisord.conf
exec nginx -g "daemon off;" "$@"
