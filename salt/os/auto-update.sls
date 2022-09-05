# Automatically crontab the OS's package manager to update all packages, then reboot.

{% if grains['needs_os_auto_update'] %}

{% if grains['os'] == 'Rocky' %}
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
{% endif %}

{% endif %}
