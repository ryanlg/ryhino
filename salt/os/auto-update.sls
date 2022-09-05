# Automatically crontab the OS's package manager to update all packages, then reboot.

/root/salt/scripts/os/dnf-upgrade-and-reboot.sh:
    file.managed:
        - source: salt://os/files/dnf-upgrade-and-reboot.sh
        - user: root
        - group: root
        - mode: 700

    cron.present:
        - identifier: "os-audo-update"
        - user: root
        - dayweek: 6
