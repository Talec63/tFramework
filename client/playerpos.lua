AddEventHandler('playerSpawned', function()
    TriggerServerEvent('Tf:SpawnPlayer')
end)

-- Setup player position --
RegisterNetEvent('Tf:lastPosition')
AddEventHandler('Tf:lastPosition', function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaulModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaulModel)
    while not HasModelLoaded(defaulModel) do
        Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), defaulModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaulModel)

    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

-- Update player position 
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('Tf:SavePlayerPosition', lastX, lastY, lastZ)
    end
end)
