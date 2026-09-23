#!/bin/bash

command -v uv >/dev/null 2>&1 && exit

curl -LsSf https://astral.sh/uv/install.sh | sh
