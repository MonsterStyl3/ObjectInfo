RegisterCommand('objid', function()
    TriggerEvent('ms-scripts:objid')
end)

RegisterNetEvent('ms-scripts:objid')
AddEventHandler('ms-scripts:objid', function()
    Citizen.CreateThread(function()                             
        while true do
            local player = GetPlayerPed(-1)                
            if IsPlayerFreeAiming(PlayerId()) and IsControlJustReleased(1,38) then         
                local entity = getEntity(PlayerId())       
                local coords = GetEntityCoords(entity)     
                local heading = GetEntityHeading(entity)   
                local model = GetEntityModel(entity)                               
                TriggerServerEvent('ms-scripts:objid:sendtodis', coords, heading, model)
            end
            Wait(5)                                           
         end                                             
    end)
end)                                             
  

function getEntity(player)                                        
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)   
    return entity                                                  
end