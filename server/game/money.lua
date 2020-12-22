local firstConnect = true
AddEventHandler("playerSpawn", function(spawn)
    if firstConnect then
        print("Première connexion")
        firstConnect = false
    end
end)