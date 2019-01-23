local network_mode="host"
local container_hostname="devarch"
local container_name="devarch"

docker run --interactive \
           --tty \
           --network host \
           --hostname "${container_hostname}"\
           --name "${container_name}"
