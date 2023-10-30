import yaml
import os

PROJECT_ROOT_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
def get_root():
    return PROJECT_ROOT_DIR

SERVER_ROOT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

config = yaml.safe_load(open(os.path.join(SERVER_ROOT_DIR, 'config.yaml') , "r").read())
def get_config():
    return config