# Check if the current directory contains a .venv folder
if [[ -d ".venv" ]]; then
    # If .venv exists in the current directory, activate it
    source .venv/bin/activate
else
    # Otherwise, activate the global virtual environment at ~/.venv
    if [[ -d "$HOME/.venv" ]]; then
        source "$HOME/.venv/bin/activate"
    else
        echo "No virtual environment found in .venv or ~/.venv"
    fi
fi
