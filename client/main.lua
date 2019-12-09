


Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	local Pressed = nil
	local Activated = nil
	local SendCoords = nil


	
	while true do 
		Citizen.Wait(1)
			if IsControlJustPressed(0, 51) and not Activated then
			Pressed = true
			Activated = true
			SendCoords = true
			end
								
				while Pressed do
					Citizen.Wait(1)
					local x,y,z = table.unpack(GetEntityCoords(ped))
					DrawText3D(x,y,z+1,"~o~Coords:  ~w~"..x.." ~o~| ~w~" ..y.. " ~o~| ~w~"..z, 0.4)
					
					if SendCoords then
						local Coords = GetEntityCoords(ped)
						local heading = GetEntityHeading(ped)	
						TriggerServerEvent("SendCoords", Coords,heading)
						SendCoords = nil
					end



					if IsControlJustPressed(0, 51) and Activated then
						Pressed = nil
						Activated = nil
						SendCoords = nil
					end
				end
		end
end)



function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
	SetTextScale(scale, scale)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
 
	AddTextComponentString(text)
	DrawText(_x, _y)
end

