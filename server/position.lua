-- Spawn du joueur
RegisterServerEvent('Tf:SpawnPlayer')
AddEventHandler('Tf:SpawnPlayer', function()
    local source = source
    exports.ghmattimysql:execute('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source)
    }, function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent('Tf:lastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

-- Sauvegarde de la position du joueurs
RegisterServerEvent('Tf:SavePlayerPosition')
AddEventHandler('Tf:SavePlayerPosition', function(PosX, PosY, PosZ)
    local source = source
    exports.ghmattimysql:execute('UPDATE users SET position = @position WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
        ['@position'] = '{ ' .. PosX  .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)

-- Message dans la console pour la save affichant les joueurs qui sont saves
AddEventHandler('playerDropped', function ()
    local src = source
    local PlayerName = GetPlayerName(src)
    print("^6Déconnexion et sauvegarde du joueur:",PlayerName,"^0")
end)