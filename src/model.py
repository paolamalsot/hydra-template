from src.submodel_B import SubModel

class Model_A:
    def __init__(
        self,
        parameter_1: int | None = None,
        parameter_2: SubModel | None = None,
        parameter_3: int | None = None,
    ):
        self.parameter_1 = parameter_1
        self.parameter_2 = parameter_2
        self.parameter_3 = parameter_3
    