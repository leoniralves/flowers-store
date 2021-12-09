#!/bin/bash

# _hi=$(arch -arm64 echo hi)
_hi=$(arch -x86_64 echo hi)

echo $_hi

# if []; then
#     echo "## arm64"
# else
#     echo "## 86_64"
# fi