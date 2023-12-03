# vim: ft=python

from dataclasses import dataclass
from datetime import datetime
from typing import Any
from zoneinfo import ZoneInfo
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

    installDate = fields.get("JBH.InstallDate", "")
    if installDate:
        installDate = azConvertInstallDate(installDate)

    return WorkItem(
        application=fields.get("Custom.Repository", ""),
        identifier=azJson["id"],
        installDate=installDate,
        state=str(fields["System.BoardColumn"]).lower().replace(" ", "-"),
        title=fields["System.Title"],
    )


def azConvertInstallDate(installDateZulu: str) -> str:
    date = datetime.strptime(installDateZulu, "%Y-%m-%dT%H:%M:%SZ").replace(
        tzinfo=ZoneInfo("UTC")
    )

    return date.astimezone(datetime.now().astimezone().tzinfo).strftime("%Y-%m-%d")


def zkNewNote(notebookPath: str, title: str, extra: str = "") -> None:
    subprocessRunner(
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
    subprocessRunner(["zk", "edit", workItemFile])
