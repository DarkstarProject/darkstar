-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Leads to Upper Delkfutt's Tower.
-- !pos 524 16 20 184
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(20) -- missing walk-through animation, but it's the best I could find.
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 20 and option == 1 then
        player:setPos(313, 16, 20, 128, 158) -- to Upper Delkfutt's Tower
    end
end
