# VIP


## Requisitos

En tu es_extended, en el config, en el apartado de Accounts tenemos que añadir la moneda corona

```
	bank = _U('account_bank'),
	black_money = _U('account_black_money'),
	money = _U('account_money'),
	coronas = 'coronas'
```

Tambien hay que añadir el archivo sql, en vuestra base de datos o copialo de aqui:
```
CREATE TABLE `sg_vip` (
  `identifier` varchar(40) NOT NULL,
  `vip` tinyint(4) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
```

Si quieres usarlo desde el es_admin2 copiate la carpeta igual que en el trew hud.


Usa el esx_vehicleshop para los coches vips.

Para añadir un coche vip solo añade la categoria vip.