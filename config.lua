Config = {
    -- @param CustomPlate boolean Enable or disable custom vehicle plate system.
    -- @param Plate string Custom vehicle plate text (up to 8 letters/numbers).
    CustomPlate = true,
    Plate = "LM",

    -- @param LockVehicles string Set the vehicle lock status. Available options: "Unlocked", "Locked", "NoInteract".
    LockVehicles = "NoInteract",

    -- @param FuelSystem string The fuel system being used. Provide your fuel script name or "none" to disable the system.
    -- @param FuelLevel string Set the fuel level for vehicles. Available range: "0" to "100".
    FuelSystem = "none",
    FuelLevel = "0",
    
    -- @param MaxDistance number The maximum distance allowed from the vehicle. If the vehicle exceeds this distance, it will be deleted.
    MaxDistance = 80.0,

    -- @param Freeze boolean Whether the vehicles should be frozen in place. Set to true or false.
    Freeze = true,

    -- @param Shadow boolean Whether vehicles should have shadow effects. Set to true or false.
    Shadow = true,

    ShowroomVehicles = {
        -- @param Model string The vehicle model name.
        -- @param Colors table List of vehicle colors. The first value is the primary color, and the second (optional) is the secondary color.
        -- @param Livery number (optional) The vehicle's livery ID (special paint job).
        -- @param Extra table (optional) List of extras to be enabled on the vehicle (e.g., spoilers, lights).
        -- @param Coords vector4 Coordinates to spawn the vehicle in the world (x, y, z, heading).

        {
            Model = "adder",
            Colors = { 1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-248.4, -924.59, 31.91, 340.23),
        },{
            Model = "t20",
            Colors = { 27,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-252.82, -922.95, 31.89, 340.23),
        },{
            Model = "italigto",
            Colors = { 42,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-256.82, -921.23, 31.71, 340.23),
        },{
            Model = "banshee2",
            Colors = { 81,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-260.96, -919.56, 31.88, 340.23),
        },{
            Model = "carbonizzare",
            Colors = { 12,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-257.28, -903.5, 31.84, 159.36),
        },{
            Model = "feltzer2",
            Colors = { 28,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-253.09, -905.02, 31.95, 159.36),
        },{
            Model = "kuruma",
            Colors = { 131,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-249.21, -906.82, 32.05, 159.36),
        },{
            Model = "coquette2",
            Colors = { 75,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-245.1, -908.46, 31.56, 159.36),
        },{
            Model = "nero2",
            Colors = { 41,1 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-240.84, -909.39, 31.9, 159.36),
        },{
            Model = "zentorno",
            Colors = { 0,41 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-236.76, -911.03, 31.89, 159.36),
        },{
            Model = "akuma",
            Colors = { 0,27 },
            Livery = 0,
            Extra = { 1,2 },
            Coords = vector4(-246.1, -917.95, 31.83, 309.20),
        },{
            Model = "sanchez",
            Colors = { 55,1 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-248.46, -916.98, 31.79, 309.20),
        },{
            Model = "bati",
            Colors = { 134,1 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-251.22, -915.75, 31.67, 309.20),
        },{
            Model = "diablous2",
            Colors = { 0,1 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-254.2, -914.67, 31.66, 309.20),
        },{
            Model = "lectro",
            Colors = { 83,1 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-256.89, -913.57, 31.85, 309.20),
        },{
            Model = "vortex",
            Colors = { 88,1 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-259.31, -912.29, 31.82, 309.20),
        },{
            Model = "weevil",
            Colors = { 80,83 },
            Livery = 2,
            Extra = { 1,2 },
            Coords = vector4(-238.98, -925.22, 31.32, 69.79),
        },
    },
}
