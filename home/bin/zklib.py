# vim: ft=python

from dataclasses import dataclass
from typing import Any
import json
import subprocess

@dataclass
class WorkItem:
    application: str
    identifier: int
    installDate: str
    state: str
    title: str


def subprocessRunner(*runargs, **kwargs) -> Any:
    kwargs.setdefault("stdout", subprocess.PIPE)
    kwargs.setdefault("check", False)
    cmd = subprocess.run(*runargs, **kwargs)

    try:
        cmd.check_returncode()
    except subprocess.CalledProcessError as err:
        print(err.stdout.decode("utf-8"))
        return None

    return cmd.stdout.decode("utf-8")


def azGetWorkItem(identifier: str | int) -> WorkItem:
    azOutput = subprocessRunner(
        [
            "az",
            "boards",
            "work-item",
            "show",
            "--id",
            str(identifier),
            "--org",
            "https://dev.azure.com/jbhunt/",
            "--output",
            "json",
        ],
    )

    azJson = json.loads(azOutput)
    fields = azJson["fields"]

    return WorkItem(
        application=fields.get("Custom.Repository", ""),
        identifier=azJson["id"],
        state=str(fields["System.BoardColumn"]).lower().replace(" ", "-"),
        title=fields["System.Title"],
    )


def zkNewNote(notebookPath: str, title: str, extra: str = "") -> None:
    subprocess.run(
        [
            "zk",
            "new",
            "--no-input",
            notebookPath,
            "--id",
            "wi",
            "--title",
            title,
            "--extra",
            extra,
        ]
    )


def zkEditFile(workItemFile: str) -> None:
    subprocess.run(["zk", "edit", workItemFile])
