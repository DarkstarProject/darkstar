-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Baya Hiramayuh
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    -- Based on scripts/zones/Mhaura/Dieh_Yamilsiah.lua
    local timer = 1152 - ((os.time() - 1009811376)%1152)
    local direction = 0 -- Arrive, 1 for depart
    local waiting = 195 -- Offset for Mhaura

    if timer <= waiting then
        direction = 1 -- Ship arrived, switch dialog from "arrive" to "depart"
    else
        timer = timer - waiting -- Ship hasn't arrived, subtract waiting time to get time to arrival
    end
    player:startEvent(232,timer,direction)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end