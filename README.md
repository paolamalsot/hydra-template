# Hydra Experiment Template

A template for running experiments with Hydra configuration management and parameter sweeps.

---

## Setup

1. **Create and activate a virtual environment:**
    ```bash
    python -m venv .venv
    source .venv/bin/activate
    ```

2. **Install dependencies:**
    ```bash
    pip install hydra-core --upgrade
    pip install hydra-submitit-launcher --upgrade
    ```

3. **Create output directory:**
    ```bash
    mkdir outfiles
    ```

---

## Project Structure

```
├── experiments/
│   ├── hydra_config/      # Hydra configuration files
│   ├── launchers/         # Launch scripts
│   └── src/main.py        # Main experiment script
├── results/               # Experiment outputs
└── outfiles/              # Additional output files
```

---

## Running a (Sweep) Experiment

```bash
cd experiments/launchers
./launch.sh
```

- The launch script specifies the path of the main config (e.g., `example_config/sweep`), read relative to the main Hydra search path (`experiments/hydra_config`).
- The config file (`experiments/hydra_config/example_config/sweep.yaml`) specifies the script to be run:  
  `experiments.src.main`

---

### Main Script

The main script (e.g., `experiments.src.main`) must contain a `parse_config` function with the following signature:

```python
def parse_config(original_root, cfg)
```

- `original_root`: Absolute path of the root directory.
- `cfg`: The Hydra config.
- The main script runs in your output directory; `original_root` helps specify paths relative to the root.

---

### Output Structure

Each parameter combination creates a separate subfolder containing:
- Hydra configuration (`.hydra/`)
- Copies of `src/` and `experiments/` directories (for reproducibility)
- Experiment results

---

### Results Location

Results are saved to the directory specified by `experiment_output_dir` in the Hydra config:
- **Default:** `results/example_hydra/`
- **Timestamped subdirectories** for each run

An output file (with potential error files, etc.) will be created in the `outfiles` directory.

---

## Using a Compute Cluster

To leverage a compute cluster:

Uncomment in the main Hydra config:

```yaml
- override hydra/launcher: ../../../hydra/launcher/cluster_4G
```

And configure SLURM parameters as needed.
Moreover, you can write `utilities/activate_py_env_cluster.sh` script to activate the environment as needed, and modify `utilities/are_we_in_cluster.sh` to check on which machine we are.