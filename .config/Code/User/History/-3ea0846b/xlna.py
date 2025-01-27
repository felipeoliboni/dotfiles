#!/usr/bin/env python3

from subprocess import run
from sys import argv, stderr
import json
import os
import traceback


def check_update() -> bool:
    fetch = run(
        ["git", "fetch", "--dry-run"],
        capture_output=True,
        check=True,
    )
    return fetch.stdout != b""


if __name__ == "__main__":
    if len(argv) < 2:
        print(
            "Please provide a package directory as an argument.",
            file=stderr,
        )
        exit(1)
    AUR_DIR = argv[1]
    packages = list(
        pkg for pkg in os.listdir(AUR_DIR)
        if os.path.isdir(os.path.join(AUR_DIR, pkg))
    )
    tooltip = []
    error_flag = False
    for pkg in packages:
        try:
            os.chdir(os.path.join(AUR_DIR, pkg))
            if check_update():
                tooltip.append(pkg)
        except Exception:
            error_flag = True
            tooltip = [traceback.format_exc()]
            break
    if error_flag:
        output = {"text": "!"}
    else:
        output = {"text": len(tooltip)}
    output["tooltip"]=' '.join(tooltip)
    print(json.dumps(output))