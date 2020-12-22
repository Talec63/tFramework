AddEventHandler("playerConnecting", function (name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier

    for k,v in pairs(identifiers) do
        if string.match(v, 'steam') then
            identifier = v
            break
        end
    end
    if not identifier then
        deferrals.done("Veuillez vous connecter avec steam !")
        print("^1Connexion impossible !")
    else
        deferrals.done()
        print("^2Connexion réussie ...")
        print("^2Steam ID:", identifier)
        exports.ghmattimysql:scalar('SELECT 1 FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        },
        function(result)
            if not result then
                exports.ghmattimysql:execute('INSERT INTO users (identifier) VALUES (@identifier)', {
                    ['@identifier'] = identifier
                })
            end
        end)
    end
end)
