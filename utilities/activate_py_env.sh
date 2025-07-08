source ~/.bashrc

activate_py_env(){
    # Get the directory where file_y.sh is located
    local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    #echo "The directory of the sourced script is: $DIR"

    cd $DIR/..

    source .venv/bin/activate
    export PYTHONPATH="${PYTHONPATH}:${pwd}"
}