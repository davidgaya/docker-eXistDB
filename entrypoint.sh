#!/bin/bash
set -e

# catch missing password
if [ -n "$EXIST_ADMIN_PASSWORD" ]; then
# inject password
/opt/exist/bin/client.sh -l -s -u admin -P \$adminPasswd << EOF 
passwd admin
${EXIST_ADMIN_PASSWORD}
${EXIST_ADMIN_PASSWORD}
quit
EOF
fi

# lets start exist...
exec /opt/exist/bin/startup.sh
