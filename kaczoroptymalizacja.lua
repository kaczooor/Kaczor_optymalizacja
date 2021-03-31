local holstered = false
local hand = false
local weapons = {
    "weapon_combatpdw",
	"weapon_microsmg",
	"weapon_smg",
	"weapon_smg_mk2",
	"weapon_assaultsmg",
	"weapon_pumpshotgun_mk2",
	"weapon_sawnoffshotgun",
	"weapon_bullpupshotgun",
	"weapon_dbshotgun",
	"weapon_carbinerifle",
	"weapon_advancedrifle",
	"weapon_compactrifle",
	"weapon_specialcarbine",
    "WEAPON_SMG",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_GOLFCLUB"


}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then            
            loadAnimDict( "reaction@intimidation@1h" )
            if CheckWeapon(ped) then
                if holstered then
                    hand = true
                    TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    Citizen.Wait(1100)
                    ClearPedTasks(ped)
                    holstered = false
                    hand = false
                end
                
            elseif not CheckWeapon(ped) then
                if not holstered then
                    TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    Citizen.Wait(1100)
                    ClearPedTasks(ped)
                    holstered = true
                end
            end
        end
    end
end)

function CheckWeapon(ped)
    for i = 1, #weapons do
        if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
            return true
        end
    end
    return false
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 50 )
    end
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if hand then
        DisableControlAction(0,21,true) -- disable sprint
        DisableControlAction(0,24,true) -- disable attack
        DisableControlAction(0,25,true) -- disable aim
        DisableControlAction(0,47,true) -- disable weapon
        DisableControlAction(0,58,true) -- disable weapon
        DisableControlAction(0,263,true) -- disable melee
        DisableControlAction(0,264,true) -- disable melee
        DisableControlAction(0,257,true) -- disable melee
        DisableControlAction(0,140,true) -- disable melee
        DisableControlAction(0,141,true) -- disable melee
        DisableControlAction(0,142,true) -- disable melee
        DisableControlAction(0,143,true) -- disable melee
    end
  end
end)


--- BLIPY ---

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	       	       {title="Sklep Multimedialny",colour=59, id=52, x=67.44, y=-1568.49, z=28},
	{title="Sklep Budowlany",colour=59, id=478, x=2748.58, y=3472.41, z=54.68},
	{title="Tequil-La La",colour=27, id=93, x=-565.906, y=276.093, z=100.176},
	{title="Bahamas",colour=27, id=93,x =-1388.409, y =-585.624, z =100.319},
	{title="Stripclub",colour=27, id=121,x =132.17, y =-1304.42, z =100.319},
	{title="Yellow Jack",colour=27, id=93,x =1992.69, y =3058.57, z =100.319},
	{title="Sklep",colour=2, id=52,x =373.875, y =325.896, z =100.319},
	{title="Sklep",colour=2, id=52,x =2557.458, y =382.282, z =100.319},
	{title="Sklep",colour=2, id=52,x =-3038.939, y =585.954, z =6.908},
	{title="Sklep",colour=2, id=52,x =-3241.927, y =1001.462, z =11.830},
	{title="Sklep",colour=2, id=52,x =547.431, y =2671.710, z =41.156},
	{title="Sklep",colour=2, id=52,x =1961.464, y =3740.672, z =31.343},
	{title="Sklep",colour=2, id=52,x =2678.916, y =3280.671, z =54.241},
	{title="Sklep",colour=2, id=52,x =1729.216, y =6414.131, z =34.037},
	{title="Sklep",colour=2, id=52,x =1135.808, y =-982.281, z =45.415},
	{title="Sklep",colour=2, id=52,x =-1222.915, y =-906.983, z =11.326},
	{title="Sklep",colour=2, id=52,x =-1487.553, y =-379.107, z =39.163},
	{title="Sklep",colour=2, id=52,x =-2968.243, y =390.910, z =14.043},
	{title="Sklep",colour=2, id=52,x =1166.024, y =2708.930, z =37.157},
	{title="Sklep",colour=2, id=52,x =1392.562, y =3604.648, z =33.980},
	{title="Sklep",colour=2, id=52,x =-48.519, y =-1757.514, z =28.421},
	{title="Sklep",colour=2, id=52,x =1163.373, y =-323.801, z =68.205},
	{title="Sklep",colour=2, id=52,x =-707.501, y =-914.260, z =18.215},
	{title="Sklep",colour=2, id=52,x =-1820.523, y =792.518, z =137.118},
    {title="Sklep",colour=2, id=52,x =1698.388, y =4924.404, z =41.063},
    {title="Sklep",colour=2, id=52,x =-1094.66, y =-2595.03, z =13.93},
    {title="Sklep",colour=2, id=52,x =25.93, y =-1347.47, z =29.5},
    {title="Sklep",colour=2, id=52,x =197.66, y =-32.41, z =69.89},
    {title="Sklep",colour=2, id=52,x =-2540.82, y =2314.24, z =32.41},
    {title="Sklep",colour=2, id=52,x =161.27, y =6640.09, z =31.7},
	{title="Sklep",colour=2, id=52,x =190.2,  y = -889.22, z = 29.71},
	{title="Hype mobile", colour=2, id=459,x = -629.7,  y = -275.16,  z = 35.58},
		
	
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


--- RECOIL ---
local recoils = {
	[`WEAPON_STUNGUN`] = {0.1, 1.1}, -- STUN GUN
	[`WEAPON_FLAREGUN`] = {0.9, 1.9}, -- FLARE GUN

	[`WEAPON_SNSPISTOL`] = {3.2, 4.2}, -- SNS PISTOL
	[`WEAPON_SNSPISTOL_MK2`] = {2.7, 3.7}, -- SNS PISTOL MK2
	[`WEAPON_VINTAGEPISTOL`] = {3.0, 4.0}, -- VINTAGE PISTOL
	[`WEAPON_PISTOL`] = {4.2, 5.2}, -- PISTOL
	[`WEAPON_PISTOL_MK2`] = {4.2, 5.2}, -- PISTOL MK2
	[`WEAPON_DOUBLEACTION`] = {3.0, 3.5}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_COMBATPISTOL`] = {3.5, 4.0}, -- COMBAT PISTOL
	[`WEAPON_HEAVYPISTOL`] = {2.6, 3.1},
	[`WEAPON_PISTOL50`] = {3.6, 4.1},	-- HEAVY PISTOL

	[`WEAPON_DBSHOTGUN`] = {0.1, 0.6}, -- DOUBLE BARREL SHOTGUN
	[`WEAPON_SAWNOFFSHOTGUN`] = {2.1, 2.6}, -- SAWNOFF SHOTGUN
	[`WEAPON_PUMPSHOTGUN`] = {2.7, 3.2}, -- PUMP SHOTGUN
	[`WEAPON_PUMPSHOTGUN_MK2`] = {2.7, 3.2}, -- PUMP SHOTGUN MK2
	[`WEAPON_BULLPUPSHOTGUN`] = {1.5, 2.0}, -- BULLPUP SHOTGUN

	[`WEAPON_MICROSMG`] = {0.07, 0.57}, -- MICRO SMG (UZI)
	[`WEAPON_SMG`] = {0.05, 0.55}, -- SMG
	[`WEAPON_SMG_MK2`] = {0.05, 0.55}, -- SMG MK2
	[`WEAPON_ASSAULTSMG`] = {0.04, 0.54}, -- ASSAULT SMG
	[`WEAPON_COMBATPDW`] = {0.04, 0.54}, -- COMBAT PDW
	[`WEAPON_GUSENBERG`] = {0.075, 0.575}, -- GUSENBERG

	[`WEAPON_COMPACTRIFLE`] = {0.05, 0.55}, -- COMPACT RIFLE
	[`WEAPON_ASSAULTRIFLE`] = {0.04, 0.54}, -- ASSAULT RIFLE
	[`WEAPON_CARBINERIFLE`] = {0.04, 0.54}, -- CARBINE RIFLE

	[`WEAPON_MARKSMANRIFLE`] = {0.5, 1.0}, -- MARKSMAN RIFLE
	[`WEAPON_SNIPERRIFLE`] = {0.5, 1.0}, -- SNIPER RIFLE

	[`WEAPON_1911PISTOL`] = {4.0, 4.5} -- 1911 PISTOL
}

local effects = {
	[`WEAPON_STUNGUN`] = {0.01, 0.02}, -- STUN GUN
	[`WEAPON_FLAREGUN`] = {0.01, 0.02}, -- FLARE GUN

	[`WEAPON_SNSPISTOL`] = {0.08, 0.16}, -- SNS PISTOL
	[`WEAPON_SNSPISTOL_MK2`] = {0.07, 0.14}, -- SNS PISTOL MK2
	[`WEAPON_VINTAGEPISTOL`] = {0.095, 0.19}, -- VINTAGE PISTOL
	[`WEAPON_PISTOL`] = {0.10, 0.20}, -- PISTOL
	[`WEAPON_PISTOL_MK2`] = {0.11, 0.22}, -- PISTOL MK2
	[`WEAPON_DOUBLEACTION`] = {0.1, 0.2}, -- DOUBLE ACTION REVOLVER
	[`WEAPON_COMBATPISTOL`] = {0.1, 0.2}, -- COMBAT PISTOL
	[`WEAPON_HEAVYPISTOL`] = {0.1, 0.2},
	[`WEAPON_PISTOL50`] = {0.1, 0.2},-- HEAVY PISTOL

	[`WEAPON_DBSHOTGUN`] = {0.1, 0.2}, -- DOUBLE BARREL SHOTGUN
	[`WEAPON_SAWNOFFSHOTGUN`] = {0.095, 0.19}, -- SAWNOFF SHOTGUN
	[`WEAPON_PUMPSHOTGUN`] = {0.59, 0.59}, -- PUMP SHOTGUN
	[`WEAPON_PUMPSHOTGUN_MK2`] = {0.59, 0.59}, -- PUMP SHOTGUN MK2
	[`WEAPON_BULLPUPSHOTGUN`] = {0.085, 0.19}, -- BULLPUP SHOTGUN

	[`WEAPON_MICROSMG`] = {0.05, 0.1}, -- MICRO SMG (UZI)
	[`WEAPON_SMG`] = {0.04, 0.08}, -- SMG
	[`WEAPON_SMG_MK2`] = {0.04, 0.08}, -- SMG MK2
	[`WEAPON_ASSAULTSMG`] = {0.035, 0.07}, -- ASSAULT SMG
	[`WEAPON_COMBATPDW`] = {0.03, 0.06}, -- COMBAT PDW
	[`WEAPON_GUSENBERG`] = {0.035, 0.07}, -- GUSENBERG

	[`WEAPON_COMPACTRIFLE`] = {0.04, 0.08}, -- COMPACT RIFLE
	[`WEAPON_ASSAULTRIFLE`] = {0.032, 0.064}, -- ASSAULT RIFLE
	[`WEAPON_CARBINERIFLE`] = {0.03, 0.06}, -- CARBINE RIFLE

	[`WEAPON_MARKSMANRIFLE`] = {0.025, 0.05}, -- MARKSMAN RIFLE
	[`WEAPON_SNIPERRIFLE`] = {0.025, 0.05}, -- SNIPER RIFLE	

	[`WEAPON_1911PISTOL`] = {0.1, 0.2}, -- 1911 PISTOL
	[`WEAPON_FIREWORK`] = {0.5, 1.0} -- FIREWORKS
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisplayAmmoThisFrame(false)

		local ped = PlayerPedId()
		if DoesEntityExist(ped) then
			local status, weapon = GetCurrentPedWeapon(ped, true)
			if status == 1 then
				if weapon == `WEAPON_FIREEXTINGUISHER` then
					SetPedInfiniteAmmo(ped, true, `WEAPON_FIREEXTINGUISHER`)
				elseif IsPedShooting(ped) then
					local inVehicle = IsPedInAnyVehicle(ped, false)

					local recoil = recoils[weapon]
					if recoil and #recoil > 0 then
						local i, tv = (inVehicle and 2 or 1), 0
						if GetFollowPedCamViewMode() ~= 4 then
							repeat
								SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + 0.1, 0.2)
								tv = tv + 0.1
								Citizen.Wait(0)
							until tv >= recoil[i]
						else
							repeat
								local t = GetRandomFloatInRange(0.1, recoil[i])
								SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + t, (recoil[i] > 0.1 and 1.2 or 0.333))
								tv = tv + t
								Citizen.Wait(0)
							until tv >= recoil[i]
						end
					end

					local effect = effects[weapon]
					if effect and #effect > 0 then
						ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', (inVehicle and (effect[1] * 3) or effect[2]))
					end
				end
			end
		end
	end
end)

-- CAR HUD ---
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


--- COPS OFF ---

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(100)
    local playerPed = GetPlayerPed(-1)
    local playerLocalisation = GetEntityCoords(playerPed)
    ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
    end
    end)

    -- Blokada nokautu trzymajÄ…c pistolet 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

--- HELP ---
RegisterCommand('help', function()
    TriggerEvent('chat:addMessage', {
    color = {255,0,0},
    multiline = true,
    args = {'^1[HYPERP]', '^3Witaj na serwerze hyperp zrobionego przez kaczor#0721 , zapraszamy na discorda https://discord.gg/3cVpnEra !!'}

    })


end)

-- kropka off --- 

local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282  -- WEAPON_MARKSMANRIFLE
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local _, hash = GetCurrentPedWeapon( ped, true )

        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and not HashInTable( hash ) ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
	
		HideHudComponentThisFrame( 14 )		
		Citizen.Wait( 0 )

    end 
end )

--- kucanie ---
local crouched = false
local proned = false
crouchKey = 343
proneKey = 36

Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 1 )
		local ped = GetPlayerPed( -1 )
		if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
			ProneMovement()
			DisableControlAction( 0, proneKey, true ) 
			DisableControlAction( 0, crouchKey, true ) 
			if ( not IsPauseMenuActive() ) then 
				if ( IsDisabledControlJustPressed( 0, crouchKey ) and not proned ) then 
					RequestAnimSet( "move_ped_crouched" )
					RequestAnimSet("MOVE_M@TOUGH_GUY@")
					
					while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
						Citizen.Wait( 100 )
					end 
					while ( not HasAnimSetLoaded( "MOVE_M@TOUGH_GUY@" ) ) do 
						Citizen.Wait( 100 )
					end 		
					if ( crouched and not proned ) then 
						ResetPedMovementClipset( ped )
						ResetPedStrafeClipset(ped)
						SetPedMovementClipset( ped,"MOVE_M@TOUGH_GUY@", 0.5)
						crouched = false 
					elseif ( not crouched and not proned ) then
						SetPedMovementClipset( ped, "move_ped_crouched", 0.55 )
						SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
						crouched = true 
					end 
				elseif ( IsDisabledControlJustPressed(0, proneKey) and not crouched and not IsPedInAnyVehicle(ped, true) and not IsPedFalling(ped) and not IsPedDiving(ped) and not IsPedInCover(ped, false) and not IsPedInParachuteFreeFall(ped) and (GetPedParachuteState(ped) == 0 or GetPedParachuteState(ped) == -1) ) then
					if proned then
						ClearPedTasksImmediately(ped)
						proned = false
					elseif not proned then
						RequestAnimSet( "move_crawl" )
						while ( not HasAnimSetLoaded( "move_crawl" ) ) do 
							Citizen.Wait( 100 )
						end 
						ClearPedTasksImmediately(ped)
						proned = true
						if IsPedSprinting(ped) or IsPedRunning(ped) or GetEntitySpeed(ped) > 5 then
							TaskPlayAnim(ped, "move_jump", "dive_start_run", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
							Citizen.Wait(1000)
						end
						SetProned()
					end
				end
			end
		else
			proned = false
			crouched = false
		end
	end
end)

function SetProned()
	ped = PlayerPedId()
	ClearPedTasksImmediately(ped)
	TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
end


function ProneMovement()
	if proned then
		ped = PlayerPedId()
		DisableControlAction(0, 23)
		if IsControlPressed(0, 32) or IsControlPressed(0, 33) then
			DisablePlayerFiring(ped, true)
		 elseif IsControlJustReleased(0, 32) or IsControlJustReleased(0, 33) then
		 	DisablePlayerFiring(ped, false)
		 end
		if IsControlJustPressed(0, 32) and not movefwd then
			movefwd = true
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
		elseif IsControlJustReleased(0, 32) and movefwd then
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
			movefwd = false
		end		
		if IsControlJustPressed(0, 33) and not movebwd then
			movebwd = true
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
		elseif IsControlJustReleased(0, 33) and movebwd then 
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
		    movebwd = false
		end
		if IsControlPressed(0, 34) then
			SetEntityHeading(ped, GetEntityHeading(ped)+2.0 )
		elseif IsControlPressed(0, 35) then
			SetEntityHeading(ped, GetEntityHeading(ped)-2.0 )
		end
	end
end

---mniej npc ---
DensityMultiplier = 0.19
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
	end
end)


--- no driveby---
-- Allow passengers to shoot
local passengerDriveBy = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)

--- palec ---

local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)


--- pasy ---

beltOn = false
AddEventHandler('wyspa_dzwon:belt', function(status)
	beltOn = status
	if beltOn then
		TriggerEvent('InteractSound_CL:PlayOnOne', 'seatbelton', 0.35)
	else
		TriggerEvent('InteractSound_CL:PlayOnOne', 'seatbeltoff', 0.35)
	end
end)

beltStatus = true
AddEventHandler('wyspa_dzwon:display', function(status)
	beltStatus = status
end)

speedBuffer = {}
velocityBuffer = {}
Citizen.CreateThread(function()
    RequestStreamedTextureDict('mpinventory')
    while not HasStreamedTextureDictLoaded('mpinventory') do
        Citizen.Wait(100)
    end

	local timer = GetGameTimer()
	while true do
		Citizen.Wait(1)

		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, false) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if vehicle ~= 0 and IsCar(vehicle, true) then
				if IsControlJustReleased(0, 58) then
					beltOn = not beltOn
					if beltOn then
						TriggerEvent('InteractSound_CL:PlayOnOne', 'belton', 0.35)
					else
						TriggerEvent('InteractSound_CL:PlayOnOne', 'beltoff', 0.35)
					end
				end

				if not beltStatus then
					--
				elseif beltOn then
					DisableControlAction(0, 75)
					DrawSprite('mpinventory', 'mp_specitem_ped', 0.162, 0.984, 0.015, 0.025, 0.0, 255, 255, 255, 255)
					DrawSprite('mpinventory', 'mp_specitem_partnericon', 0.162, 0.984, 0.01, 0.02, 0.0, 0, 255, 0, 255)
				else
					DrawSprite('mpinventory', 'mp_specitem_ped', 0.162, 0.984, 0.015, 0.025, 0.0, 255, 255, 255, 255)
					if (GetGameTimer() - timer) > 1000 then
						timer = GetGameTimer()
					elseif (GetGameTimer() - timer) > 500 then
						DrawSprite('mpinventory', 'mp_specitem_partnericon', 0.162, 0.984, 0.01, 0.02, 0.0, 255, 0, 0, 255)
					end
				end

				speedBuffer[2] = speedBuffer[1]
				speedBuffer[1] = GetEntitySpeed(vehicle)
				if speedBuffer[2] ~= nil and not beltOn and GetEntitySpeedVector(vehicle, true).y > 1.0 and speedBuffer[1] > 19.25 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
					local hr = GetEntityHeading(entity) + 90.0
					if hr < 0.0 then
						hr = 360.0 + hr
					end

					hr = hr * 0.0174533
					local forward = { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
					local coords = GetEntityCoords(ped)

					SetEntityCoords(ped, coords.x + forward.x, coords.y + forward.y, coords.z - 0.47, true, true, true)
					SetEntityVelocity(ped, velocityBuffer[2].x, velocityBuffer[2].y, velocityBuffer[2].z)

					Citizen.Wait(1)
					SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
				end

				velocityBuffer[2] = velocityBuffer[1]
				velocityBuffer[1] = GetEntityVelocity(vehicle)
			end
		else
			beltOn = false
			speedBuffer[1], speedBuffer[2], velocityBuffer[1], velocityBuffer[2] = 0.0, 0.0, 0.0, 0.0
		end
	end
end)

function IsCar(v, ignoreBikes)
	if ignoreBikes and IsThisModelABike(GetEntityModel(v)) then
		return false
	end

	local vc = GetVehicleClass(v)
	return (vc >= 0 and vc <= 12) or vc == 17 or vc == 18 or vc == 20
end


--- pchanie pojazdu ---

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
  
  function ShowNotification(text)
      SetNotificationTextEntry("STRING")
      AddTextComponentString(text)
      DrawNotification(false, false)
  end
  
  local First = vector3(0.0, 0.0, 0.0)
  local Second = vector3(5.0, 5.0, 5.0)
  
  local Vehicle = {Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil}
  Citizen.CreateThread(function()
      Citizen.Wait(200)
      while true do
          local ped = PlayerPedId()
          local posped = GetEntityCoords(GetPlayerPed(-1))
          local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 20.0, 0.0)
          local rayHandle = CastRayPointToPoint(posped.x, posped.y, posped.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, ped, 0)
          local a, b, c, d, closestVehicle = GetRaycastResult(rayHandle)
          local Distance = GetDistanceBetweenCoords(c.x, c.y, c.z, posped.x, posped.y, posped.z, false);
  
          local vehicleCoords = GetEntityCoords(closestVehicle)
          local dimension = GetModelDimensions(GetEntityModel(closestVehicle), First, Second)
          if Distance < 6.0  and not IsPedInAnyVehicle(ped, false) then
              Vehicle.Coords = vehicleCoords
              Vehicle.Dimensions = dimension
              Vehicle.Vehicle = closestVehicle
              Vehicle.Distance = Distance
              if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
                  Vehicle.IsInFront = false
              else
                  Vehicle.IsInFront = true
              end
          else
              Vehicle = {Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil}
          end
          Citizen.Wait(500)
      end
  end)
  
  
  Citizen.CreateThread(function()
      while true do 
          Citizen.Wait(5)
          local ped = PlayerPedId()
          if Vehicle.Vehicle ~= nil then
                  if IsVehicleSeatFree(Vehicle.Vehicle, -1) and GetVehicleEngineHealth(Vehicle.Vehicle) <= 100 then
                      ShowNotification('Trzymaj [~g~SHIFT~w~] + [~g~E~w~] aby pchac pojazd!')
                  end
       
  
              if IsControlPressed(0, Keys["LEFTSHIFT"]) and IsVehicleSeatFree(Vehicle.Vehicle, -1) and not IsEntityAttachedToEntity(ped, Vehicle.Vehicle) and IsControlJustPressed(0, Keys["E"])  and GetVehicleEngineHealth(Vehicle.Vehicle) <= 100 then
                  NetworkRequestControlOfEntity(Vehicle.Vehicle)
                  local coords = GetEntityCoords(ped)
                  if Vehicle.IsInFront then    
                      AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y * -1 + 0.1 , Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 180.0, 0.0, false, false, true, false, true)
                  else
                      AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y - 0.3, Vehicle.Dimensions.z  + 1.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, true)
                  end
  
                  RequestAnimDict('missfinale_c2ig_11')
                  TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                  Citizen.Wait(200)
                   while true do
                      Citizen.Wait(5)
                      if IsDisabledControlPressed(0, Keys["A"]) then
                          TaskVehicleTempAction(PlayerPedId(), Vehicle.Vehicle, 11, 1000)
                      end
  
                      if IsDisabledControlPressed(0, Keys["D"]) then
                          TaskVehicleTempAction(PlayerPedId(), Vehicle.Vehicle, 10, 1000)
                      end
  
                      if Vehicle.IsInFront then
                          SetVehicleForwardSpeed(Vehicle.Vehicle, -1.0)
                      else
                          SetVehicleForwardSpeed(Vehicle.Vehicle, 1.0)
                      end
  
                      if HasEntityCollidedWithAnything(Vehicle.Vehicle) then
                          SetVehicleOnGroundProperly(Vehicle.Vehicle)
                      end
  
                      if not IsDisabledControlPressed(0, Keys["E"]) then
                          DetachEntity(ped, false, false)
                          StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                          FreezeEntityPosition(ped, false)
                          break
                      end
                  end
              end
          end
      end
  end)


--- PIERWSSZA ---

local shot = false
local check = false
local check2 = false
local count = 0

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and check == false then
			    check = false
			else
			    SetFollowPedCamViewMode(4)
			    check = true
			end
		else
		    if check == true then
		        SetFollowPedCamViewMode(1)
				check = false
			end
		end
	end
end )



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, iter in ipairs({1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18}) do
			HideHudComponentThisFrame(iter)
		end

		local ped = PlayerPedId()

		local inVehicle = IsPedInAnyVehicle(ped, false)
		if not show then
			HideHudComponentThisFrame(14)
			local aiming, shooting = IsControlPressed(0, 25), IsPedShooting(ped)
			if aiming or shooting then
				if shooting and not aiming then
					isShooting = true
					aimTimer = 0
				else
					isShooting = false
				end

				if not isAiming then
					isAiming = true

					lastCamera = GetFollowPedCamViewMode()
					if lastCamera ~= 4 then
						SetFollowPedCamViewMode(4)
					end
				elseif GetFollowPedCamViewMode() ~= 4 then
					SetFollowPedCamViewMode(4)
				end
			elseif isAiming then
				local off = true
				if isShooting then
					off = false
					aimTimer = aimTimer + 20
					if aimTimer == 3000 then
						isShooting = false
						aimTimer = 0
						off = true
					end
				end

				if off then
					isAiming = false
					if lastCamera ~= 4 then
						SetFollowPedCamViewMode(lastCamera)
					end
				end
			elseif not inVehicle then
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
			end
		end

		if inVehicle then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if DoesVehicleHaveWeapons(vehicle) == 1 then
				local vehicleWeapon, vehicleWeaponHash = GetCurrentPedVehicleWeapon(playerped)
				if vehicleWeapon == 1 then
					DisableVehicleWeapon(true, vehicleWeaponHash, vehicle, playerPed)
					SetCurrentPedVehicleWeapon(playerPed, `WEAPON_UNARMED`)
				end
			end

			DisableControlAction(0, 354, true)
			DisableControlAction(0, 351, true)
			DisableControlAction(0, 350, true)
			DisableControlAction(0, 357, true)
		end
	end
end)

--- rece do gory ---

Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 323) then --Start holding X
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)
	

---schuff---
local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it


---status----


Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(812255500455903243)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('big')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('text')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText(printServ);


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Discord!", "https://discord.gg/9BMcS9AtxS")
        SetDiscordRichPresenceAction(1, "Connect!", "fivem://connect/pl.waw.node1.avhost.pl:34182")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)