source ~/.bashrc

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../../utilities/activate_py_env_platform_agnostic.sh
source $DIR/set_outfile.sh

activate_py_env_platform_agnostic

option_searchpath="hydra.searchpath=[${root}/experiments/hydra_config/]"

multirun() {
    config_name="$1"  # The Hydra config file name
    config_main=$(dirname "$config_name")  # Main config before the dot
    config_sub=$(basename "$config_name")  # Sub-config after the dot

    option_configpath="--config-path ../../experiments/hydra_config/${config_main}"
    local outfile=$(make_outfile)
    python experiments/utilities/experiment.py $option_configpath -m -cn "$config_sub" &> "$outfile"
}

single_run() {
    config_name="$1"  # The Hydra config file name
    config_main=$(dirname "$config_name")  # Main config before the dot
    config_sub=$(basename "$config_name")  # Sub-config after the dot

    option_configpath="--config-path ../../experiments/hydra_config/${config_main}"
    local outfile=$(make_outfile)
    # Launch the single run
    python experiments/utilities/experiment.py $option_configpath -cn "$config_sub" &> "$outfile"
}