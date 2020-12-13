--[[Discord : discord.gg/VhNxmgu]]
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Position -----------

local position = {
    {x = -559.906,  y = 287.093,   z = 82.176}, --Tequil-La La
    {x = -1393.409, y = -606.624,  z = 30.319}, --Bahamas
    {x = 127.830,   y = -1284.796, z = 29.280}, --Stripclub
    {x = 1986.18,   y = 3054.31,   z = 47.32}, --Yellow Jack
    {x = -1586.922,   y = -3012.860, z = -76.004}, --Galaxy Upstairs / Wainting for the nightclub id blip
    {x = -1578.204,   y = -3014.460, z = -79.005}, --Galaxy Downstairs / Wainting for the nightclub id blip
    {x = 373.875,   y = 325.896,  z = 103.566},
    {x = 2557.458,  y = 382.282,  z = 108.622},
    {x = -3038.939, y = 585.954,  z = 7.908},
    {x = -3241.927, y = 1001.462, z = 12.830},
    {x = 547.431,   y = 2671.710, z = 42.156},
    {x = 1961.464,  y = 3740.672, z = 32.343},
    {x = 2678.916,  y = 3280.671, z = 55.241},
    {x = 1729.216,  y = 6414.131, z = 35.037},
    {x = 1135.808,  y = -982.281,  z = 46.415},
    {x = -1222.915, y = -906.983,  z = 12.326},
    {x = -1487.553, y = -379.107,  z = 40.163},
    {x = -2968.243, y = 390.910,   z = 15.043},
    {x = 1166.024,  y = 2708.930,  z = 38.157},
    {x = 1392.562,  y = 3604.684,  z = 34.980},
    {x = -48.519,   y = -1757.514, z = 29.421},
    {x = 1163.373,  y = -323.801,  z = 69.205},
    {x = -707.501,  y = -914.260,  z = 19.215},
    {x = -1820.523, y = 792.518,   z = 138.118},
    {x = 1698.388,  y = 4924.404,  z = 42.063},
    {x = 25.67,     y = -1346.37,  z = 29.49},
}

CRIfruit              = {}
CRIfruit.DrawDistance = 100
CRIfruit.Size         = {x = 1.0, y = 1.0, z = 1.0}
CRIfruit.Color        = {r = 255, g = 0, b = 0}
CRIfruit.Type         = 21

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (CRIfruit.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < CRIfruit.DrawDistance) then
                DrawMarker(CRIfruit.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, CRIfruit.Size.x, CRIfruit.Size.y, CRIfruit.Size.z, CRIfruit.Color.r, CRIfruit.Color.g, CRIfruit.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour parler au vendeur")
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('cr_shop', 'main'), not RageUI.Visible(RMenu:Get('cr_shop', 'main')))
                end   
            end
        end
    end
end)

------------ Création du Menu -----------

RMenu.Add('cr_shop', 'main', RageUI.CreateMenu("Boutique!", "~b~Nourriture et Boisson"))
RMenu.Add('cr_shop', 'boisson', RageUI.CreateSubMenu(RMenu:Get('cr_shop', 'main'), "Boisson", "~b~Menu Boisson"))
RMenu.Add('cr_shop', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('cr_shop', 'main'), "Nourriture", "~b~Menu Nourriture"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('cr_shop', 'main'), true, true, true, function()

            RageUI.Button("🥤 Boisson", nil, {RightLabel = "→→→"},true, function()
            end, RMenu:Get('cr_shop', 'boisson'))

            RageUI.Button("🥡 Nourriture", nil, {RightLabel = "→→→"},true, function()
            end, RMenu:Get('cr_shop', 'nourriture'))

            RageUI.Button("⏳~r~Fermer le menu", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('cr_shop', 'boisson'), true, true, true, function()

            RageUI.Button("Eau", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('cr_buyshop:BuyEau')
                end
            end)

            RageUI.Button("Ice-tea", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('cr_buyshop:Buyicetea')
                end
            end)

            RageUI.Button("Lait", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('cr_buyshop:Buylait')
                end
            end)
        end, function()
        end)

            RageUI.IsVisible(RMenu:Get('cr_shop', 'nourriture'), true, true, true, function()

                RageUI.Button("Pain", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('cr_buyshop:BuyPain')
                    end
                end)

                RageUI.Button("Sandwich", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('cr_buyshop:Buysandwich')
                    end
                end)

                RageUI.Button("Chocolat", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('cr_buyshop:Buychocolate')
                    end
                end)

                RageUI.Button("CupCake", nil, {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('cr_buyshop:Buycupcake')
                    end
                end)
                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)

------------ Blip -----------

local blips = {
    {name="Boutique", colour=2, id=52, x = -559.906,  y = 287.093,   z = 82.176}, --Tequil-La La / Blips doc: https://wiki.gtanet.work/index.php?title=Blips
    {name="Boutique", colour=2, id=52, x = -1393.409, y = -606.624,  z = 30.319}, --Bahamas
    {name="Boutique", colour=2, id=52, x = 127.830,   y = -1284.796, z = 29.280}, --Stripclub
    {name="Boutique", colour=2, id=52, x = 1986.18,   y = 3054.31,   z = 47.32}, --Yellow Jack
    {name="Boutique", colour=2, id=52, x = -1586.922,   y = -3012.860, z = -76.004}, --Galaxy Upstairs / Wainting for the nightclub id blip
    {name="Boutique", colour=2, id=52, x = -1578.204,   y = -3014.460, z = -79.005}, --Galaxy Downstairs / Wainting for the nightclub id blip
    {name="Boutique", colour=2, id=52, x = 373.875,   y = 325.896,  z = 103.566},
    {name="Boutique", colour=2, id=52, x = 2557.458,  y = 382.282,  z = 108.622},
    {name="Boutique", colour=2, id=52, x = -3038.939, y = 585.954,  z = 7.908},
    {name="Boutique", colour=2, id=52, x = -3241.927, y = 1001.462, z = 12.830},
    {name="Boutique", colour=2, id=52, x = 547.431,   y = 2671.710, z = 42.156},
    {name="Boutique", colour=2, id=52, x = 1961.464,  y = 3740.672, z = 32.343},
    {name="Boutique", colour=2, id=52, x = 2678.916,  y = 3280.671, z = 55.241},
    {name="Boutique", colour=2, id=52, x = 1729.216,  y = 6414.131, z = 35.037},
    {name="Boutique", colour=2, id=52, x = 1135.808,  y = -982.281,  z = 46.415},
    {name="Boutique", colour=2, id=52, x = -1222.915, y = -906.983,  z = 12.326},
    {name="Boutique", colour=2, id=52, x = -1487.553, y = -379.107,  z = 40.163},
    {name="Boutique", colour=2, id=52, x = -2968.243, y = 390.910,   z = 15.043},
    {name="Boutique", colour=2, id=52, x = 1166.024,  y = 2708.930,  z = 38.157},
    {name="Boutique", colour=2, id=52, x = 1392.562,  y = 3604.684,  z = 34.980},
    {name="Boutique", colour=2, id=52, x = -48.519,   y = -1757.514, z = 29.421},
    {name="Boutique", colour=2, id=52, x = 1163.373,  y = -323.801,  z = 69.205},
    {name="Boutique", colour=2, id=52, x = -707.501,  y = -914.260,  z = 19.215},
    {name="Boutique", colour=2, id=52, x = -1820.523, y = 792.518,   z = 138.118},
    {name="Boutique", colour=2, id=52, x = 1698.388,  y = 4924.404,  z = 42.063},
    {name="Boutique", colour=2, id=52, x = 25.67,     y = -1346.37,  z = 29.49},
 }

Citizen.CreateThread(function()

   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 0.6)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.name)
     EndTextCommandSetBlipName(info.blip)
   end
end)