# 👉 cr_shop Présentation

--> 26 Boutiques sur la carte

--> Script fait en RageUI

--> Permet d'acheter des boissons et de la nourriture

--> Blip présent sur la map

# 🔊 Discord

--> Discord : https://discord.gg/VhNxmgu

--> Retrouvez moi sur discord : CR#9463

# 📷 Vidéo / Preview :

--> Aperçu : https://steamuserimages-a.akamaihd.net/ugc/1652222878200853970/997EAE4978718A2DFCC7CFED00F8F15F97EAAEEA/
https://steamuserimages-a.akamaihd.net/ugc/1652222878200854544/68B19CB38C7CCD43680A7BCCD35AA25655C276F8/
https://steamuserimages-a.akamaihd.net/ugc/1652222878200855012/00F1CE72A9378E8BA476FF67DF29784E67499E2C/

--> Blip : https://steamuserimages-a.akamaihd.net/ugc/1652222878200854695/69FB30984DA9D751576493474A5C6ED1D2ABED8C/


# ⚙️Installation
1. Importez `items.sql` dans votre base de données

2. Ajoutez ceci dans votre `server.cfg`:

```ensure cr_shop```

3. Aller dans esx_basicneeds\server et dans le `main.lua` ajouter: 

```lua
ESX.RegisterUsableItem('bread', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bread', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
end)

ESX.RegisterUsableItem('chocolate', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chocolate', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_chocolate'))
end)

ESX.RegisterUsableItem('sandwich', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sandwich', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_sandwich'))
end)

ESX.RegisterUsableItem('cupcake', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cupcake', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_cupcake'))
end)

ESX.RegisterUsableItem('water', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('water', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_water'))
end)

ESX.RegisterUsableItem('icetea', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('icetea', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_icetea'))
end)

ESX.RegisterUsableItem('milk', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('milk', 1)

    TriggerClientEvent('esx_status:add', source, 'drunk', -150000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_milk'))
end)
```


# 🔖 Copyright (C) 2020 CR
