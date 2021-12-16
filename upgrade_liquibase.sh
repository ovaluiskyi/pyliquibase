#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LBVERSION="4.6.2"
LBFILE="liquibase-${LBVERSION}.zip"

# download liquibase
wget "https://github.com/liquibase/liquibase/releases/download/v${LBVERSION}/liquibase-${LBVERSION}.zip" -O "${DIR}/${LBFILE}"
unzip -o "${DIR}/${LBFILE}" -d "${DIR}/pyliquibase/liquibase"
rm "liquibase-${LBVERSION}.zip"

# commit to git
git add .
git commit -m "upgrade liquibase ${LBVERSION}"