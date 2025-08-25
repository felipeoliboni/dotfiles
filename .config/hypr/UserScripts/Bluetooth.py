#!/usr/bin/env python3

import subprocess
import re
import json
import sys

def get_connected_devices():
    try:
        result = subprocess.run(['bluetoothctl', 'devices', 'Connected'],
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              text=True,
                              timeout=5)
        
        # Extrai endereços MAC dos dispositivos conectados
        devices = []
        for line in result.stdout.splitlines():
            if 'Device' in line:
                parts = line.split()
                if len(parts) >= 2:
                    devices.append(parts[1])
        return devices
    except Exception as e:
        print(f"Erro ao verificar dispositivos: {e}", file=sys.stderr)
        return []

def get_bluetooth_battery(mac_address=None):
    try:
        if not mac_address:
            connected_devices = get_connected_devices()
            if not connected_devices:
                return None
            mac_address = connected_devices[0]
        
        result = subprocess.run(['bluetoothctl', 'info', mac_address],
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              text=True,
                              timeout=5)
        
        # Tenta vários padrões de bateria
        patterns = [
            r'Battery Percentage:\s*\((\d+)%\)',
            r'Battery Level:\s*\((\d+)%\)',
            r'battery:\s*(\d+)%'
        ]
        
        for pattern in patterns:
            match = re.search(pattern, result.stdout)
            if match:
                return int(match.group(1))
        
        return None
    except Exception as e:
        print(f"Erro ao obter bateria: {e}", file=sys.stderr)
        return None

def main():
    connected_devices = get_connected_devices()
    
    if not connected_devices:
        output = {
            "text": "",
            "alt": "Sem Bluetooth",
            "tooltip": "",
            "class": "bluetooth-battery"
        }
    else:
        battery = get_bluetooth_battery(connected_devices[0])
        
        if battery is not None:
            icons = [
                (90, "󰁹"),
                (70, "󰂂"),
                (50, "󰂀"),
                (30, "󰁾"),
                (10, "󰁼"),
                (0, "󰁺")
            ]
            
            icon = next((i[1] for i in icons if battery >= i[0]), "󰂑")
            battery_class = "low" if battery <= 20 else ""
            
            output = {
                "text": f"{icon} {battery}%",
                "alt": f"BT {battery}%",
                "tooltip": f"Bateria Bluetooth: {battery}%",
                "class": battery_class,
                "percentage": battery
            }
        else:
            output = {
                "text": "󰂯 BT",
                "alt": "BT conectado",
                "tooltip": "Dispositivo conectado (sem info de bateria)",
                "class": "bluetooth-battery"
            }
    
    print(json.dumps(output))

if __name__ == "__main__":
    main()
