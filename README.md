# GTAVServer
Servidor de GTAV usando el mod de FiveM. 

## Requisitos

1. [Visual C++ Redistributable 2019](https://aka.ms/vs/16/release/VC_redist.x64.exe)

## Instalación

1. Copia el directorio en tu Disco Duro C:
2. Genera una Key para el servidor en https://keymaster.fivem.net
3. Copia y Pega el codigo en el archivo server.cfg donde dice "pega_aqui_tu_key". Quedando algo tal que asi:

```
sv_licenseKey 3l8nwvj2gffa6hp3r2226ddbd6kk5hdd6aa
```

4. Pon los datos de conexión de tu MySQL en mysql_connection_string. Debe quedar algo asi:

```
set mysql_connection_string "mysql://usuario:123456@localhost/es_extended?charset=utf8mb4"
```

5. Ejecuta el archivo run_server.cmd 

### Versiones Usadas

Build Servidor 2430
es_extended v1

