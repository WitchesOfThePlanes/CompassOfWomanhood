from pathlib import Path

from tra_tools import DFile


dialogue_root_path = Path('CompassOfWomanhood/dialogues').absolute()

def test_00_test_tra_identifiers():
    d_file_paths = dialogue_root_path.rglob("*.d")
    for d_file_path in d_file_paths:
        with DFile.from_path(d_file_path) as d_file:
            d_file.check_string_identifiers()

