from hydra.utils import instantiate


def parse_config(original_root, cfg):

    #instantiate the model
    model = instantiate(cfg.model)

    with open("results.txt", "w") as f:
        f.write(f"{model.parameter_1=}, {model.parameter_2=}, {model.parameter_3=}\n")
