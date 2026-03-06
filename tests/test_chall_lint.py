import logging
import os
import unittest
from pathlib import Path

import yaml

logging.basicConfig(level=logging.INFO)


class TestYamlFile(unittest.TestCase):
    def setUp(self):
        yaml_files = []
        for dirpath, _, filenames in os.walk("./"):
            # logging.info(f"--> {filenames}")
            for filename in filenames:
                if filename == "challenge.yml":
                    yaml_files.append(os.path.join(dirpath, filename))
        self.yaml_files = yaml_files

    def test_yaml_is_valid(self):
        """Check that the YAML file can be parsed without errors"""
        for yaml_file in self.yaml_files:
            with open(yaml_file, "r") as f:
                try:
                    data = yaml.safe_load(f)
                except yaml.YAMLError as e:
                    self.fail(f"YAML parsing failed: {e}")
                    self.assertIsNotNone(data, "YAML file is empty or invalid")

    def test_required_keys(self):
        """Check that certain keys exist in the YAML file"""
        for yaml_file in self.yaml_files:
            print(yaml_file)
            with open(yaml_file, "r") as f:
                data = yaml.safe_load(f)
                required_keys = [
                    "name",
                    "version",
                    "author",
                    "category",
                    "value",
                    "flags",
                    "tags",
                    "state",
                ]
                for key in required_keys:
                    self.assertIn(key, data, f"Missing required key: {key}")


    def test_files_present(self):
        """Check if required chall file is present"""
        for yaml_file in self.yaml_files:
            yaml_path = Path(yaml_file).resolve()
            base_dir = yaml_path.parent

            with yaml_path.open("r") as f:
                data = yaml.safe_load(f)

            if "files" in data:
                for file in data["files"]:
                    src_file = (base_dir / file).resolve()
                    self.assertTrue(
                        src_file.exists(),
                        msg=f"Missing file: {src_file}"
                    )

if __name__ == "__main__":
    unittest.main()
