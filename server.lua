Webhook = ''
RegisterServerEvent('ms-scripts:objid:sendtodis')
AddEventHandler('ms-scripts:objid:sendtodis', function(coords, heading, model)
    sendToDiscord(16753920, "Object Info", "Coords : " .. coords .. "\nHeading : " .. heading .. "\nModel : " .. model , "ms-scripts")
end)


function sendToDiscord(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
  
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end