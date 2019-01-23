#!/usr/bin/env zsh

local image_name="devarch"
local image_tag="test"


local script_path="${0:h:A}"
pushd "${script_path}" > /dev/null

mini_dotfiles_dir="$(realpath ./home/.mini-dotfiles)"
if [[ -d "${mini_dotfiles_dir}" ]]; then
    rm -rf "${mini_dotfiles_dir}"
fi
git clone --depth 1 "https://github.com/filwie/mini-dotfiles.git" "${mini_dotfiles_dir}"

docker build --tag "${image_name}:${image_tag}" \
             --file ./docker/Dockerfile \
             .

popd > /dev/null
