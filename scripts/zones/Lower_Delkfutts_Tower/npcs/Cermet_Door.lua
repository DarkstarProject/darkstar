-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Leads to Upper Delkfutt's Tower.
-- !pos 524 16 20 184
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(20); -- missing walk-through animation, but it's the best I could find.
    return 1;
end;

function onEventUpdate(player,csid,option)
    --print("CSID:",csid);
    --print("RESULT:",option);
end;

function onEventFinish(player,csid,option)
    --print("CSID:",csid);
    --print("RESULT:",option);

    if (csid == 20 and option == 1) then
        player:setPos(313, 16, 20, 128, 0x9E);    -- to Upper Delkfutt's Tower
    end
end;
