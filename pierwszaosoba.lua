--[[-----------------------------------------------------------------------|
Made by Cheleber - Hope you Enjoy
If you need my help or wanna help me, here is my Discord: https://discord.gg/HjrRg8N
--]]-----------------------------------------------------------------------|


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
