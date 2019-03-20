-----------------------------------
-- Area:  Nyzul_Isle
-- NPC:   Vending Box
-- Notes: Pick Temp items for assault
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/keyitems")
require("scripts/zones/Nyzul_Isle/IDs")
-----------------------------------
-- Todo: get prefered items to work, and option all items

function onTrigger(player, npc)
    local prefered = 0 -- set prefered items at Sorrowfull_sage
	local tokens = player:getCurrency("nyzul_isle_assault_point")

    player:startEvent(202 , 1, tokens, 1, prefered, 100, 200, 300)
end

function onEventUpdate(player, csid, option)
    local items =
    {
        [8450]  = {item = 5385, cost = 100}, -- Barbarian's Drink
        [8451]  = {item = 5386, cost = 100}, -- Fighter's Drink
        [8452]  = {item = 5387, cost = 100}, -- Oracle's Drink 
        [8453]  = {item = 5388, cost = 100}, -- Assassin's Drink
        [8454]  = {item = 5389, cost = 100}, -- Spy's Dring
        [8455]  = {item = 5394, cost = 100}, -- Gnostic's Drink
        [8456]  = {item = 5396, cost = 100}, -- Shepherd's Drink
        [8457]  = {item = 5436, cost = 100}, -- Dusty Reraise -+
        [8458]  = {item = 5437, cost = 100}, -- Strange Milk -+
        [8459]  = {item = 5438, cost = 100}, -- Strange Juice -+
        [8460]  = {item = 5439, cost = 100}, -- Viscer's Drink
        [8461]  = {item = 5397, cost = 100}, -- Sprinters Drink
        [12546] = {item = 5390, cost = 200}, -- Braver's Drink
        [12547] = {item = 5391, cost = 200}, -- Soldier's Drink
        [12548] = {item = 5392, cost = 200}, -- Champion's Drink
        [12549] = {item = 5393, cost = 200}, -- Monarch's Drink -+
        [12550] = {item = 5395, cost = 200}, -- Cleric's Drink
        [12551] = {item = 5431, cost = 200}, -- Dusty Potion -+
        [12552] = {item = 5432, cost = 200}, -- Dusty Ether -+
        [12553] = {item = 5434, cost = 200}, -- Fanatic's Drink
        [12554] = {item = 5435, cost = 200}, -- Fool's Drink
        [12555] = {item = 5440, cost = 200}, -- Dusty Wing -+
        [12556] = {item = 4147, cost = 200}, -- Body Boost
        [12555] = {item = 4200, cost = 200}, -- Mana Boost
        [16641] = {item = 5433, cost = 300}, -- Dusty Elixer -+
    }
    if csid == 202 then
        for k, v in pairs(items) do
            if k == option and player:getCurrency("nyzul_isle_assault_point") >= v.cost then
                if player:hasItem(v.item) then
                    player:messageSpecial(ID.text.ALREADY_HAVE_TEMP_ITEM)
                else
                    player:addTempItem(v.item)
                    player:messageSpecial(ID.text.TEMP_ITEM_OBATINED, v.item);
                    player:delCurrency("nyzul_isle_assault_point", v.cost)
                end
            end
        end
        local prefered = 0 -- set prefered items at Sorrowfull_sage
        local tokens = player:getCurrency("nyzul_isle_assault_point")
        player:updateEvent(1, tokens, 1, prefered, 100, 200, 300)
    end
end

function onEventFinish(player, csid, option, npc)
end