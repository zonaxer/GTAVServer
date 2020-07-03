Config = {}
Config.Locale = 'es'

Config.KickPossibleCheaters = true -- If true it will kick the player that tries store a vehicle that they changed the Hash or Plate.
Config.UseCustomKickMessage = true -- If KickPossibleCheaters is true you can set a Custom Kick Message in the locales.

Config.UseDamageMult = false -- If true it costs more to store a Broken Vehicle.
Config.DamageMult = 2 -- Higher Number = Higher Repair Price.

Config.EngineHealth = 900

Config.CarPoundPrice      = 700 -- Car Pound Price.
Config.BoatPoundPrice     = 2000 -- Boat Pound Price.
Config.AircraftPoundPrice = 7500 -- Aircraft Pound Price.


Config.UseCarGarages        = true -- Allows use of Car Garages.
Config.UseBoatGarages       = true -- Allows use of Boat Garages.
Config.UseAircraftGarages   = false -- Allows use of Aircraft Garages.
Config.UsePrivateCarGarages = true -- Allows use of Private Car Garages.
Config.UseJobCarGarages     = true -- Allows use of Job Garages.

Config.MarkerType   = 1
Config.DrawDistance = 100.0

Config.TimePound = 1800 -- 30 min in seconds

-- Fuel decor - No need to change this, just leave it.
Config.FuelDecor = "_FUEL_LEVEL"

Config.BlipGarage = {
	Sprite = 290,
	Color = 38,
	Display = 2,
	Scale = 1.0
}

Config.BlipGaragePrivate = {
	Sprite = 290,
	Color = 53,
	Display = 2,
	Scale = 1.0
}

Config.BlipPound = {
	Sprite = 67,
	Color = 64,
	Display = 2,
	Scale = 1.0
}


Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Green Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.DeleteMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 5.0, y = 5.0, z = 1.0  -- Big Size Circle
}

Config.PoundMarker = {
	r = 0, g = 0, b = 100,     -- Blue Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}


-- Start of Jobs
Config.PoliceGarages = {
	Police_LosSantos ={
		GaragePoint = { x = 436.29, y = -996.86, z = 24.82 },
		SpawnPoints = {
			{ coords = vector3(435.86, -1019.01, 27.9), heading = 94.5, radius = 6.0 },
		 },
		DeletePoint = { x = 447.89, y = -997.66, z = 24.83}
	}
}

Config.AmbulanceGarages = {
	Ambulance_LosSantos ={
		GaragePoint = { x = 339.88, y = -561.53, z = 27.76 },
		SpawnPoints = {
			{ coords = vector3(351.47, -547.0, 27.79), heading = 278.5, radius = 6.0 },
		 },
		DeletePoint = { x = 344.45, y = -554.48, z = 27.76}
	}
}

Config.TaxiGarages = {
	Taxi_LosSantos ={
		GaragePoint = { x=919.47, y= -165.65, z= 73.70 },
		SpawnPoints = {
			{ coords = vector3(908.88, -175.83, 73.23), heading = 232.5, radius = 6.0 },
		 },
		DeletePoint = { x=900.55, y= -188.66, z= 72.8}
	}
}

Config.MechanicGarages = {
	Mechanic_LosSantos ={
		GaragePoint = { x = -359.81, y = -127.73, z = 37.72 },
		SpawnPoints = {
			{ coords = vector3(-363.58, -120.41, 37.69), heading = 75.5, radius = 6.0 },
		 },
		DeletePoint = { x = -356.61, y = -115.39, z = 37.71}
	}
}

Config.ElCartelGarages = {
	ElCartel_LosSantos ={
		GaragePoint = { x = 1401.59, y = 1115.22, z = 113.93 },
		SpawnPoints = {
			{ coords = vector3(1401.51, 1118.44, 113.87), heading = 95.5, radius = 6.0 },
		 },
		DeletePoint = { x = 1407.73, y = 1119.03, z = 113.84}
	}
}

Config.LosCortesGarages = {
	LosCortes_LosSantos ={
		GaragePoint = { x = -21.26, y = -1434.33, z = 29.69 },
		SpawnPoints = {
			{ coords = vector3(-24.88, -1437.07, 29.68), heading = 179.5, radius = 6.0 },
		 },
		DeletePoint = { x = -25.23, y = -1428.22, z = 29.71}
	}
}

-- End of Jobs
-- Start of Cars

Config.CarGarages = {
	Garage_CentralLS = {
		GaragePoint = { x = 215.800, y = -810.057, z = 29.727 },
		SpawnPoints = {
			{ coords = vector3(229.700, -800.1149, 29.5722), heading = 157.84, radius = 6.0 },
			{ coords = vector3(236.96, -782.66, 29.7), heading =  150.5, radius = 6.0 },
			{ coords = vector3(234.46, -764.9, 29.84), heading = 243.5, radius = 6.0 },
		 },
		DeletePoint = { x = 223.797, y = -760.415, z = 29.646 }
	},
	Garage_Sandy = {
		GaragePoint = { x = 1737.59, y = 3710.2, z = 33.14 },
		SpawnPoints = { 
			{ coords = vector3(1737.84, 3719.28,  33.04), heading = 21.22, radius = 6.0 },
		},
		DeletePoint = { x = 1722.66, y = 3713.74, z = 33.21 }
	},
	Garage_Paleto = {
		GaragePoint = { x = 105.359, y = 6613.586, z = 31.3973 },
		SpawnPoints = { 
			{ coords = vector3( 128.7822, 6622.9965, 30.7828), heading = 315.01, radius = 6.0 },
		},
		DeletePoint = { x = 126.3572, y = 6608.4150, z = 30.8565 }
	},
	Garage_Prison = {
		GaragePoint = { x = 1846.56, y = 2585.86, z = 44.67 },
		SpawnPoints = { 
			{ coords = vector3(1855.11, 2592.72, 44.67), heading = 274.8, radius = 6.0 },
		},
		DeletePoint = { x = 1855.21, y = 2615.3, z = 34.67 } -- z = 44.67
	},
	Garage_RaceTrack = {
		GaragePoint = { x = 1212.32, y = 339.94, z = 80.99 },
		SpawnPoints = { 
			{ coords = vector3(1199.02, 330.92, 80.99), heading = 144.86, radius = 6.0 },
		},
		DeletePoint = { x = 1207.9, y = 343.8, z = 80.99 }
	}
}

Config.CarPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
		SpawnPoints = { 
			{ coords = vector3(405.64, -1643.4, 27.61), heading = 229.54, radius = 6.0 },
		}
	},
	Pound_Sandy = {
		PoundPoint = { x = 1651.38, y = 3804.84, z = 37.65 },
		SpawnPoints = { 
			{ coords = vector3(1627.84, 3788.45,  33.77), heading = 308.53 , radius = 6.0 },
		}
	},
	Pound_Paleto = {
		PoundPoint = { x = -234.82, y = 6198.65, z = 30.94 },
		SpawnPoints = { 
			{ coords = vector3(-230.08, 6190.24, 30.49), heading = 140.24, radius = 6.0 }, }
	}
}

-- End of Cars
-- Start of Boats

Config.BoatGarages = {
	Garage_LSDock = {
		GaragePoint = { x = -735.87, y = -1325.08, z = 0.6 },
		SpawnPoints = { 
			{ coords = vector3(-718.87, -1320.18, -0.47477427124977), heading = 232.5, radius = 6.0 },
		},
		StoreTP    = vector4(-734.77, -1337.64,  0.7, 52.5),
		DeletePoint = { x = -731.15, y = -1334.71, z = -0.47477427124977 }
	},
	Garage_SandyDock = {
		GaragePoint = { x = 1333.2, y = 4269.92, z = 30.5 },
		SpawnPoints = { 
			{ coords = vector3(1334.61, 4264.68, 29.86), heading = 264.0, radius = 6.0 },
		},
		StoreTP = vector4( 1333.69,4273.61, 31.05, 356.5),
		DeletePoint = { x = 1323.73, y = 4269.94, z = 29.86 }
	},
	Garage_PaletoDock = {
		GaragePoint = { x = -283.74, y = 6629.51, z = 6.3 },
		SpawnPoints = { 
			{ coords = vector3(-290.46, 6622.72, -0.47477427124977), heading = 52.0, radius = 6.0 },
		},
		StoreTP = vector4( -292.01, 6588.98, 1.1, 251.5),
		DeletePoint = { x = -304.66, y = 6607.36, z = -0.47477427124977 }
	}
}

Config.BoatPounds = {
	Pound_LSDock = {
		PoundPoint = { x = -738.67, y = -1400.43, z = 4.0 },
		SpawnPoints = { 
			{ coords = vector3(-738.33, -1381.51, 0.12), heading = 137.85, radius = 6.0 },
		}
	},
	Pound_SandyDock = {
		PoundPoint = { x = 1299.36, y = 4217.93, z = 32.91 },
		SpawnPoints = { 
			{ coords = vector3(1294.35, 4226.31, 29.86), heading = 345.0, radius = 6.0 },
		}
	},
	Pound_PaletoDock = {
		PoundPoint = { x = -270.2, y = 6642.43, z = 6.36 },
		SpawnPoints = {
			 { coords = vector3(-290.38, 6638.54, -0.47477427124977), heading = 130.0, radius = 6.0 },
	}
	}
}

-- End of Boats
-- Start of Aircrafts

Config.AircraftGarages = {
	Garage_LSAirport = {
		GaragePoint = { x = -1617.14, y = -3145.52, z = 12.99 },
		SpawnPoints = { 
			{ coords = vector3(-1657.99, -3134.38, 12.99), heading = 330.11, radius = 6.0 },
		},
		DeletePoint = { x = -1642.12, y = -3144.25, z = 12.99 }
	},
	Garage_SandyAirport = {
		GaragePoint = { x = 1723.84, y = 3288.29, z = 40.16 },
		SpawnPoints = { 
		{ coords = vector3(1710.85, 3259.06, 40.69), heading = 104.66 , radius = 6.0 },
	},
		DeletePoint = { x = 1714.45, y = 3246.75, z = 40.07 }
	},
	Garage_GrapeseedAirport = {
		GaragePoint = { x = 2152.83, y = 4797.03, z = 40.19 },
		SpawnPoints = { 
			{ coords = vector3(2122.72, 4804.85, 40.78), heading = 115.04, radius = 6.0 },
		 },
		DeletePoint = { x = 2082.36, y = 4806.06, z = 40.07 }
	}
}

Config.AircraftPounds = {
	Pound_LSAirport = {
		PoundPoint = { x = -1243.0, y = -3391.92, z = 12.94 },
		SpawnPoints = { 
			{ coords = vector3(-1272.27, -3382.46, 12.94), heading = 330.25, radius = 6.0 },
		 }
	}
}

-- End of Aircrafts
-- Start of Private Garages

Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	Garage_MazeBankBuilding = {
		Private = "MazeBankBuilding",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = {{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 }, },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = {{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 }, },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = { { coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 }, },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = { 
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveRich = {
		Private = "ExecutiveRich",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = {
			 { coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveCool = {
		Private = "ExecutiveCool",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = { 
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = {
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = {
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = { 
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoints = { 
			{ coords = vector3(-44.031, -787.363,  43.186), heading = 254.322, radius = 6.0 },
		},
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	Garage_LomBank = {
		Private = "LomBank",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = {
			 { coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
			},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = {
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 }, 
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = {
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = {
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoints = { 
			{ coords = vector3(-1551.88, -581.383,  24.708), heading = 331.176, radius = 6.0 },
		},
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	Garage_MazeBankWest = {
		Private = "MazeBankWest",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 }, 
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = {
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = {
			 { coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = {  
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = {  
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 }, 
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoints = { 
			{ coords = vector3(-1376.93, -474.32, 30.5), heading = 97.95, radius = 6.0 },
		},
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	Garage_IntegrityWay = {
		Private = "IntegrityWay",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoints = { 
			{ coords = vector3(-7.351, -635.1, 34.724), heading = 66.632, radius = 6.0 },
		},
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay28 = {
		Private = "IntegrityWay28",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoints = { 
			{ coords = vector3(-7.351, -635.1, 34.724), heading = 66.632, radius = 6.0 },
		},
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay30 = {
		Private = "IntegrityWay30",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoints = { 
			{ coords = vector3(-7.351, -635.1, 34.724), heading = 66.632, radius = 6.0 },
		},
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	Garage_DellPerroHeights = {
		Private = "DellPerroHeights",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoints = { 
			{ coords = vector3(-1483.16, -505.1, 31.81), heading = 299.89 , radius = 6.0 },
		},
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoints = {
			 { coords = vector3(-1483.16, -505.1, 31.81), heading = 299.89 , radius = 6.0 },
			},
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoints = { 
			{ coords = vector3(-1483.16, -505.1, 31.81), heading = 299.89 , radius = 6.0 },
		},
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	Garage_MiltonDrive = {
		Private = "MiltonDrive",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern1Apartment = {
		Private = "Modern1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern2Apartment = {
		Private = "Modern2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern3Apartment = {
		Private = "Modern3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody1Apartment = {
		Private = "Mody1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody2Apartment = {
		Private = "Mody2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody3Apartment = {
		Private = "Mody3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			 { coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = {
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 }, 
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal1Apartment = {
		Private = "Regal1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal2Apartment = {
		Private = "Regal2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal3Apartment = {
		Private = "Regal3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoints = { 
			{ coords = vector3(-800.496, 333.468, 84.5), heading = 180.494, radius = 6.0 },
		},
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	Garage_RichardMajesticApt2 = {
		Private = "RichardMajesticApt2",
		GaragePoint = { x = -887.5, y = -349.58, z = 33.534 },
		SpawnPoints = { 
			{ coords = vector3(-886.03, -343.78, 33.534), heading = 206.79, radius = 6.0 },
		},
		DeletePoint = { x = -894.324, y = -349.326, z = 33.534 }
	},
	Garage_WildOatsDrive = {
		Private = "WildOatsDrive",
		GaragePoint = { x = -178.65, y = 503.45, z = 135.85 },
		SpawnPoints = { 
			{ coords = vector3(-189.98, 505.8, 133.48), heading = 282.62, radius = 6.0 },
		},
		DeletePoint = { x = -189.28, y = 500.56, z = 132.93 }
	},
	Garage_WhispymoundDrive = {
		Private = "WhispymoundDrive",
		GaragePoint = { x = 123.65, y = 565.75, z = 183.04 },
		SpawnPoints = { 
			{ coords = vector3(130.11, 571.47, 182.42), heading = 270.71  , radius = 6.0 },
		},
		DeletePoint = { x = 131.97, y = 566.77, z = 181.95 }
	},
	Garage_NorthConkerAvenue2044 = {
		Private = "NorthConkerAvenue2044",
		GaragePoint = { x = 348.18, y = 443.01, z = 146.7 },
		SpawnPoints = { 
			{ coords = vector3(358.397, 437.064, 144.277), heading = 285.911 , radius = 6.0 },
		},
		DeletePoint = { x = 351.383, y = 438.865, z = 145.66 }
	},
	Garage_NorthConkerAvenue2045 = {
		Private = "NorthConkerAvenue2045",
		GaragePoint = { x = 370.69, y = 430.76, z = 144.11 },
		SpawnPoints = { 
			{ coords = vector3(392.88, 434.54, 142.17), heading = 264.94, radius = 6.0 },
		},
		DeletePoint = { x = 389.72, y = 429.95, z = 141.81 }
	},
	Garage_HillcrestAvenue2862 = {
		Private = "HillcrestAvenue2862",
		GaragePoint = { x = -688.71, y = 597.57, z = 142.64 },
		SpawnPoints = {
			{ coords = vector3(-683.72, 609.88, 143.28), heading = 338.06, radius = 6.0 },
		},
		DeletePoint = { x = -685.259, y = 601.083, z = 142.365 }
	},
	Garage_HillcrestAvenue2868 = {
		Private = "HillcrestAvenue2868",
		GaragePoint = { x = -752.753, y = 624.901, z = 141.2 },
		SpawnPoints = { 
			{ coords = vector3(-749.32, 628.61, 141.48), heading = 197.14, radius = 6.0 },
		},
		DeletePoint = { x = -754.286, y = 631.581, z = 141.2 }
	},
	Garage_HillcrestAvenue2874 = {
		Private = "HillcrestAvenue2874",
		GaragePoint = { x = -859.01, y = 695.95, z = 147.93 },
		SpawnPoints = { 
			{ coords = vector3(-863.681, 698.72, 147.052), heading = 341.77, radius = 6.0 },
		},
		DeletePoint = { x = -855.66, y = 698.77, z = 147.81 }
	},
	Garage_MadWayneThunder = {
		Private = "MadWayneThunder",
		GaragePoint = { x = -1290.95, y = 454.52, z = 96.66 },
		SpawnPoints = { 
			{ coords = vector3(-1297.62, 459.28,96.48), heading = 285.652, radius = 6.0 },
		},
		DeletePoint = { x = -1298.088, y = 468.952, z = 96.0 }
	},
	Garage_TinselTowersApt12 = {
		Private = "TinselTowersApt12",
		GaragePoint = { x = -616.74, y = 56.38, z = 42.736 },
		SpawnPoints = { 
			{ coords = vector3(-620.588, 60.102, 42.736), heading = 109.316, radius = 6.0 },
		},
		DeletePoint = { x = -621.128, y = 52.691, z = 42.735 }
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	Garage_MedEndApartment1 = {
		Private = "MedEndApartment1",
		GaragePoint = { x = 240.23, y = 3102.84, z = 41.49 },
		SpawnPoint = { x = 233.58, y = 3094.29, z = 41.49, h = 93.91 },
		DeletePoint = { x = 237.52, y = 3112.63, z = 41.39 }
	},
	Garage_MedEndApartment2 = {
		Private = "MedEndApartment2",
		GaragePoint = { x = 246.08, y = 3174.63, z = 41.72 },
		SpawnPoint = { x = 234.15, y = 3164.37, z = 41.54, h = 102.03 },
		DeletePoint = { x = 240.72, y = 3165.53, z = 41.65 }
	},
	Garage_MedEndApartment3 = {
		Private = "MedEndApartment3",
		GaragePoint = { x = 984.92, y = 2668.95, z = 39.06 },
		SpawnPoint = { x = 993.96, y = 2672.68, z = 39.06, h = 0.61 },
		DeletePoint = { x = 994.04, y = 2662.1, z = 39.13 }
	},
	Garage_MedEndApartment4 = {
		Private = "MedEndApartment4",
		GaragePoint = { x = 196.49, y = 3027.48, z = 42.89 },
		SpawnPoint = { x = 203.1, y = 3039.47, z = 42.08, h = 271.3 },
		DeletePoint = { x = 192.24, y = 3037.95, z = 42.89 }
	},
	Garage_MedEndApartment5 = {
		Private = "MedEndApartment5",
		GaragePoint = { x = 1724.49, y = 4638.13, z = 42.31 },
		SpawnPoint = { x = 1723.98, y = 4630.19, z = 42.23, h = 117.88 },
		DeletePoint = { x = 1733.66, y = 4635.08, z = 42.24 }
	},
	Garage_MedEndApartment6 = {
		Private = "MedEndApartment6",
		GaragePoint = { x = 1670.76, y = 4740.99, z = 41.08 },
		SpawnPoint = { x = 1673.47, y = 4756.51, z = 40.91, h = 12.82 },
		DeletePoint = { x = 1668.46, y = 4750.83, z = 40.88 }
	},
	Garage_MedEndApartment7 = {
		Private = "MedEndApartment7",
		GaragePoint = { x = 15.24, y = 6573.38, z = 31.72 },
		SpawnPoint = { x = 16.77, y = 6581.68, z = 31.42, h = 222.6 },
		DeletePoint = { x = 10.45, y = 6588.04, z = 31.47 }
	},
	Garage_MedEndApartment8 = {
		Private = "MedEndApartment8",
		GaragePoint = { x = -374.73, y = 6187.06, z = 30.54 },
		SpawnPoint = { x = -377.97, y = 6183.73, z = 30.49, h = 223.71 },
		DeletePoint = { x = -383.31, y = 6188.85, z = 30.49 }
	},
	Garage_MedEndApartment9 = {
		Private = "MedEndApartment9",
		GaragePoint = { x = -24.6, y = 6605.99, z = 30.45 },
		SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
		DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
	},
	Garage_MedEndApartment10 = {
		Private = "MedEndApartment10",
		GaragePoint = { x = -365.18, y = 6323.95, z = 28.9 },
		SpawnPoint = { x = -359.49, y = 6327.41, z = 28.83, h = 218.58 },
		DeletePoint = { x = -353.47, y = 6334.57, z = 28.83 }
	}
	-- End of VENT Custom Garages
}

-- End of Private Garages
