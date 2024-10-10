-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local LockVehicle = Config["LockVehicles"] == "Unlocked" and 1 or Config["LockVehicles"] == "Locked" and 2 or Config["LockVehicles"] == "NoInteract" and 3 or false
local UseFuel = Config["FuelSystem"] ~= "none"
local FuelExport = UseFuel and Config["FuelSystem"] or nil
local FuelLevel = UseFuel and Config["FuelLevel"] or "0"
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local Ped = PlayerPedId()
        local Coords = GetEntityCoords(Ped)

        for Number,Vehicle in pairs(Config.ShowroomVehicles) do
            local Distance = #(Vehicle["Coords"]["xyz"] - Coords)

            if Vehicle["Entity"] and DoesEntityExist(Vehicle["Entity"]) and Distance >= Config["MaxDistance"] then
                DeleteEntity(Vehicle["Entity"])
                Config.ShowroomVehicles[Number]["Entity"] = nil
            end

            if Distance <= Config["MaxDistance"] and not Vehicle["Entity"] then
                if not LoadModel(Vehicle["Model"]) then
                    Config.ShowroomVehicles[Number] = nil -- Stop consume on loop
                    return 
                end

                Vehicle["Entity"] = CreateVehicle(Vehicle["Model"],Vehicle["Coords"],false,false)
                SetVehicleOnGroundProperly(Vehicle["Entity"])
                SetEntityInvincible(Vehicle["Entity"], true)
                SetVehicleDirtLevel(Vehicle["Entity"], 0.0)

                if Vehicle["Colors"] then
                    SetVehicleColours(Vehicle["Entity"], Vehicle["Colors"][1], Vehicle["Colors"][2])
                end

                if LockVehicle then
                    SetVehicleDoorsLocked(Vehicle["Entity"], LockVehicle)
                end

                if Config["Freeze"] then
                    FreezeEntityPosition(Vehicle["Entity"], true)
                end

                if Config["CustomPlate"] then
                    SetVehicleNumberPlateText(Vehicle["Entity"], Config["Plate"])
                end

                if UseFuel then
                    exports[FuelExport]:SetFuel(Vehicle["Entity"], FuelLevel)
                end

                if Vehicle["Livery"] then
                    if GetNumVehicleMods(Vehicle["Entity"], 48) == 0 and GetVehicleLiveryCount(Vehicle["Entity"]) ~= 0 then
                        SetVehicleLivery(Vehicle["Entity"], Vehicle["Livery"])
                        SetVehicleMod(Vehicle["Entity"], 48, -1, false)
                    else
                        SetVehicleMod(Vehicle["Entity"], 48, (Vehicle["Livery"] - 1), false)
                        SetVehicleLivery(Vehicle["Entity"], -1)
                    end
                end

                if Vehicle["Extra"] then
                    for Index,Extra in pairs(Vehicle["Extra"]) do
                        SetVehicleExtra(Vehicle["Entity"],Extra,0)
                    end
                end

                if not Config["Shadow"] then
                    SetVehicleShadowEffect(Vehicle["Entity"], Config["Shadow"])
                end
            end
        end

        Wait(8000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOADMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function LoadModel(Model)
    local Timeout = GetGameTimer() + 5000

    RequestModel(Model)
    while not HasModelLoaded(Model) and GetGameTimer() < Timeout do
        Wait(100)
    end

    return HasModelLoaded(Model)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ONRESOURCESTOP
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStop",function(Resource)
    if Resource == GetCurrentResourceName() then
        for Number,Vehicle in pairs(Config.ShowroomVehicles) do
            if Vehicle["Entity"] and DoesEntityExist(Vehicle["Entity"]) then
                DeleteEntity(Vehicle["Entity"])
                Config.ShowroomVehicles[Number]["Entity"] = nil
            end
        end
    end
end)