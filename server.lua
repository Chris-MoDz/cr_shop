ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------ Nourriture -----------

RegisterNetEvent('cr_buyshop:BuyPain')
AddEventHandler('cr_buyshop:BuyPain', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bread', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('cr_buyshop:Buysandwich')
AddEventHandler('cr_buyshop:Buysandwich', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sandwich', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('cr_buyshop:Buychocolate')
AddEventHandler('cr_buyshop:Buychocolate', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('chocolate', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('cr_buyshop:Buycupcake')
AddEventHandler('cr_buyshop:Buycupcake', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('cupcake', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

------------ Boisson -----------

RegisterNetEvent('cr_buyshop:BuyEau')
AddEventHandler('cr_buyshop:BuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('cr_buyshop:Buyicetea')
AddEventHandler('cr_buyshop:Buyicetea', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('icetea', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('cr_buyshop:Buylait')
AddEventHandler('cr_buyshop:Buylait', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('milk', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)