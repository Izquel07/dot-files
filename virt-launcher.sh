#!/bin/bash

# 1. Pide contraseña por GUI para encender el servicio
if pkexec systemctl start libvirtd; then
    
    # 2. Si la contraseña es correcta, lanza la interfaz gráfica
    # El script se quedará "pausado" aquí hasta que cierres la ventana
    virt-manager
    
    # 3. Al cerrar virt-manager, vuelve a pedir contraseña para apagarlo
    pkexec systemctl stop libvirtd
else
    # Si cancelas la ventana de contraseña, aborta todo
    notify-send "Virt-Manager" "Autenticación cancelada. El servicio no inició."
fi
