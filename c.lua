Citizen.CreateThread(function()
    local ison = false
    local display = ison
    function lights() 
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        ToggleVehicleMod(veh, 22, true)
        function toggler()
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsColour(veh, 1)
            Citizen.Wait(80)
            ToggleVehicleMod(veh, 22, false)
            Citizen.Wait(1)
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsColour(veh, 1)
            Citizen.Wait(80)
            ToggleVehicleMod(veh, 22, false)
            Citizen.Wait(1)
        end
        function toggleb()
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsColour(veh, 8)
            Citizen.Wait(80)
            ToggleVehicleMod(veh, 22, false)
            Citizen.Wait(1)
            ToggleVehicleMod(veh, 22, true)
            SetVehicleXenonLightsColour(veh, 8)
            Citizen.Wait(80)
            ToggleVehicleMod(veh, 22, false)
            Citizen.Wait(1)
        end
        while ison==true do 
            Citizen.Wait(100)
            toggler()
            Citizen.Wait(100)
            toggleb()
        end
    end
    
    function toggle()
        if ison==false  then
            ison=true
            bool=ison
            SendNUIMessage({
                type = "ui",
                status = bool
            }) 
        else if ison==true then
            ison=false
            bool=ison
            SendNUIMessage({
                type = "ui",
                status = bool
            }) 
        end
    end 
    while true do
        Citizen.Wait(1)
        if ison==true then        
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local isem = GetVehicleClass(veh) 
            if isem==18 then
            lights()
            end
        else 
            ToggleVehicleMod(veh, 22, false)
        end
    end
end
end)

RegisterCommand("px", function()
    Citizen.Wait(1)
    toggle()
    
    
end)


