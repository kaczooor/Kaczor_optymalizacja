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
