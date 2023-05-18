#!/bin/sh

set -ex

# use specified user name or use `default` if not specified
MY_USERNAME="${MY_USERNAME:-default}"

# use specified group name or use the same user name also as the group name
MY_GROUP="${MY_GROUP:-${MY_USERNAME}}"

# use the specified UID for the user
MY_UID="${MY_UID:-1000}"

# use the specified GID for the user
MY_GID="${MY_GID:-${MY_UID}}"


# check to see if group exists; if not, create it
if grep -q -E "^${MY_GROUP}:" /etc/group > /dev/null 2>&1
then
  echo "INFO: Group exists; skipping creation"
else
  echo "INFO: Group doesn't exist; creating..."
  # create the group
  groupadd -g "${MY_GID}" "${MY_GROUP}" || (echo "INFO: Group exists but with a different name; renaming..."; groupmod -g "${MY_GID}" -n "${MY_GROUP}" "$(awk -F ':' '{print $1":"$3}' < /etc/group | grep ":${MY_GID}$" | awk -F ":" '{print $1}')")
fi


# check to see if user exists; if not, create it
if id -u "${MY_USERNAME}" > /dev/null 2>&1
then
  echo "INFO: User exists; skipping creation"
else
  echo "INFO: User doesn't exist; creating..."
  # create the user
  useradd -m -l -u "${MY_UID}" -g "${MY_GROUP}" -G wheel "${MY_USERNAME}"
  export HOME=/home/"${MY_USERNAME}"
fi

# start app
echo "INFO: Running app as ${MY_USERNAME}:${MY_GROUP} (${MY_UID}:${MY_GID})"

# exec and run the actual process specified in the CMD of the Dockerfile (which gets passed as ${*})
exec chroot --userspec=${MY_USERNAME}:${MY_GROUP} --groups=wheel / "${@}"
