local HUD = {

	Speed 			= 'kmh', -- kmh or mph

	DamageSystem 	= false, 

	SpeedIndicator 	= true,

	ParkIndicator 	= false,

	Top 			= false, -- ALL TOP PANAL ( oil, dsc, plate, fluid, ac )

	Plate 			= false, -- only if Top is false and you want to keep Plate Number

	RpmIndicator	= true

}



local RPM = 0

local RPMTime = GetGameTimer()

local Status = true



AddEventHandler('carhud:display', function(status)

	Status = status

end)





Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if Status then

			local MyPed = GetPlayerPed(-1)

			if IsPedInAnyVehicle(MyPed, false) then



				local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)

				local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)

				local VehStopped = IsVehicleStopped(MyPedVeh)

				local VehEngineHP = GetVehicleEngineHealth(MyPedVeh) 

				local VehBodyHP = GetVehicleBodyHealth(MyPedVeh)

				local VehBurnout = IsVehicleInBurnout(MyPedVeh)



				if HUD.Speed == 'kmh' then

					Speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6 + 0.5)

				elseif HUD.Speed == 'mph' then

					Speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936 + 0.5)

				else

					Speed = 0.0

				end



				local Gear = GetVehicleCurrentGear(MyPedVeh)

				--if not GetIsVehicleEngineRunning(MyPedVeh) then

					--Gear = 'P'

				if GetVehicleClass(MyPedVeh) == 15 or GetVehicleClass(MyPedVeh) == 16 then

					Gear = 'F'

				elseif GetVehicleClass(MyPedVeh) == 14 then

					Gear = 'S'

				elseif Gear == 0 then

					Gear = 'R'

					if Speed > 0.0 then

						Speed = Speed * -1

					end

				end



				local RPMScale = 0

				if (GetVehicleClass(MyPedVeh) >= 0 and GetVehicleClass(MyPedVeh) <= 5) or (GetVehicleClass(MyPedVeh) >= 9 and GetVehicleClass(MyPedVeh) <= 12) or GetVehicleClass(MyPedVeh) == 17 or GetVehicleClass(MyPedVeh) == 18 or GetVehicleClass(MyPedVeh) == 20 then

					RPMScale = 7000

				elseif GetVehicleClass(MyPedVeh) == 6 then

					RPMScale = 7500

				elseif GetVehicleClass(MyPedVeh) == 7 then

					RPMScale = 8000

				elseif GetVehicleClass(MyPedVeh) == 8 then

					RPMScale = 11000

				end



				if RPMTime <= GetGameTimer() then

					local r = GetVehicleCurrentRpm(MyPedVeh)

					--if not GetIsVehicleEngineRunning(MyPedVeh) then

						---r = 0

					if r > 0.99 then

						r = r * 100

						r = r + math.random(-2,2)



						r = r / 100

						if r < 0.12 then

							r = 0.12

						end

					else

						r = r - 0.1

					end



					RPM = math.floor(RPMScale * r + 0.5)

					if RPM < 0 then

						RPM = 0

					elseif Speed == 0.0 and r ~= 0 then

						RPM = math.random(RPM, (RPM + 50))

					end



					RPM = math.floor(RPM / 10) * 10

					RPMTime = GetGameTimer() + 50

				end



				local UI = {

					x = 0.00,

					y = 0.00

				}

				if HUD.Top then

					drawTxt(UI.x + 0.563, 	UI.y + 1.2624, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)

					drawRct(UI.x + 0.0625, 	UI.y + 0.768, 0.045, 0.037, 0,0,0,150)  

					drawRct(UI.x + 0.028, 	UI.y + 0.777, 0.029, 0.02, 0,0,0,150)   

					drawRct(UI.x + 0.1131, 	UI.y + 0.777, 0.031, 0.02, 0,0,0,150)   

					drawRct(UI.x + 0.1445, 	UI.y + 0.777, 0.0129, 0.028, 0,0,0,150) 

					drawRct(UI.x + 0.014, 	UI.y + 0.777, 0.013, 0.028, 0,0,0,150)  

					drawRct(UI.x + 0.014, 	UI.y + 0.768, 0.043, 0.007, 0,0,0,150)  

					drawRct(UI.x + 0.0279, 	UI.y + 0.798, 0.0293, 0.007, 0,0,0,150) 

					drawRct(UI.x + 0.0575, 	UI.y + 0.768, 0.004, 0.037, 0,0,0,150)  

					drawRct(UI.x + 0.1131, 	UI.y + 0.768, 0.044, 0.007, 0,0,0,150)  

					drawRct(UI.x + 0.1131, 	UI.y + 0.798, 0.031, 0.007, 0,0,0,150)  

					drawRct(UI.x + 0.1085, 	UI.y + 0.768, 0.004, 0.037, 0,0,0,150)  



					if VehBurnout then

						drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "~r~DSC", 255, 255, 255, 200)

					else

						drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 255, 255, 150)

					end	



					if (VehEngineHP > 0) and (VehEngineHP < 300) then

						drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "~y~Fluid", 255, 255, 255, 200)

						drawTxt(UI.x + 0.514, UI.y + 1.269, 1.0,1.0,0.45, "~w~~y~Oil", 255, 255, 255, 200)

						drawTxt(UI.x + 0.645, UI.y + 1.270, 1.0,1.0,0.45, "~y~AC", 255, 255, 255, 200)

					elseif VehEngineHP < 1 then 

						drawRct(UI.x + 0.159, UI.y + 0.809, 0.005, 0,0,0,0,100)  -- panel damage

						drawTxt(UI.x + 0.645, UI.y + 1.270, 1.0,1.0,0.45, "~r~AC", 255, 255, 255, 200)

						drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "~r~Fluid", 255, 255, 255, 200)

						drawTxt(UI.x + 0.514, UI.y + 1.269, 1.0,1.0,0.45, "~w~~r~Oil", 255, 255, 255, 200)

						drawTxt(UI.x + 0.645, UI.y + 1.270, 1.0,1.0,0.45, "~r~AC", 255, 255, 255, 200)

					else

						drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 255, 150)

						drawTxt(UI.x + 0.514, UI.y + 1.269, 1.0,1.0,0.45, "Oil", 255, 255, 255, 150)

						drawTxt(UI.x + 0.645, UI.y + 1.270, 1.0,1.0,0.45, "~w~AC", 255, 255, 255, 150)

					end

					if HUD.ParkIndicator then

						drawRct(UI.x + 0.159, UI.y + 0.768, 0.0122, 0.038, 0,0,0,150)

						if VehStopped then

							drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)

						else

							drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "P", 255, 255, 255, 150)

						end

					end

				else

					if HUD.Plate then

						drawTxt(UI.x + 0.61, 	UI.y + 1.385, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)



						drawRct(UI.x + 0.11, 	UI.y + 0.89, 0.045, 0.037, 0,0,0,150)  

					end

					if HUD.ParkIndicator then

						drawRct(UI.x + 0.142, UI.y + 0.848, 0.0122, 0.038, 0,0,0,150)



						if VehStopped then

							drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)

						else

							drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "P", 255, 255, 255, 150)

						end

					end

				end

				if HUD.SpeedIndicator then

					drawRct(UI.x + 0.1195, 	UI.y + 0.938, 0.036,0.03,0,0,0,100) -- Speed panel

					if HUD.Speed == 'kmh' then

						drawTxt(UI.x + 0.62, 	UI.y + 1.431, 1.0,1.0,0.5 , "~" .. ("w" or "w") .. "~" .. Speed, 255, 255, 255, 255)

						drawTxt(UI.x + 0.637, 	UI.y + 1.438, 1.0,1.0,0.35, "~" .. (Speed > 85 and (Speed > 155 and "r" or "y") or "w") .. "~km/h", 255, 255, 255, 255)

					elseif HUD.Speed == 'mph' then

						drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~r~" .. Speed, 255, 255, 255, 255)

						drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ mph", 255, 255, 255, 255)

					else

						drawTxt(UI.x + 0.81, 	UI.y + 1.42, 1.0,1.0,0.64 , [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)

					end

				end

				if HUD.RpmIndicator and RPMScale ~= 0 then

					drawRct(UI.x + 0.1135, 	UI.y + 0.804, 0.042,0.026,0,0,0,100) -- RPM panel

					drawTxt(UI.x + 0.6137, 	UI.y + 1.296, 1.0,1.0,0.45 , "~" .. (RPM > (RPMScale - 1000) and "r" or "w") .. "~" .. RPM, 255, 255, 255, 255)

					drawTxt(UI.x + 0.635, 	UI.y + 1.3, 1.0,1.0,0.35, "~w~rpm/~y~" .. Gear, 255, 255, 255, 255)

				end

		

				if HUD.DamageSystem then

					drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)

					drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)

					drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005, VehBodyHP / 5800,0,0,0,100)

					drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005, VehEngineHP / 5800,0,0,0,100)

				end

			end

		end

	end

end)



function drawTxt(x,y ,width,height,scale, text, r,g,b,a)

    SetTextFont(4)

    SetTextProportional(0)

    SetTextScale(scale, scale)

    SetTextColour(r, g, b, a)

    SetTextDropShadow(0, 0, 0, 0,255)

    SetTextEdge(2, 0, 0, 0, 255)

    SetTextDropShadow()

    SetTextOutline()

    SetTextEntry("STRING")

    AddTextComponentString(text)

    DrawText(x - width/2, y - height/2 + 0.005)

end



function drawRct(x,y,width,height,r,g,b,a)

	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)

end



--------------------

----- TEMPOMAT -----

--------------------




















