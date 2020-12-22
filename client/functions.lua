-- Fonctions côtés clients

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

function DrawText3d(coords, text)
	local _, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
	SetTextScale(0.2, 0.2)
	SetTextFont(0)
	SetTextProportional(true)
	SetTextColour(201, 201, 201, 255)
	SetTextDropShadow()
	SetTextDropshadow(50, 0, 0, 0, 255)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	DrawText(_x, _y)
end