-----------------------------------
-- Area:  Lower Delkfutt's Tower
-- NPC:   Cermet Door
-- Notes: Leads to Upper Delkfutt's Tower.
-- @pos 524 16 20 184
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0014); -- missing walk-through animation, but it's the best I could find.
    return 1;
end;
  
-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
    --print("CSID:",csid);
    --print("RESULT:",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    --print("CSID:",csid);
    --print("RESULT:",option);

    if (csid == 0x0014 and option == 1) then
        player:setPos(313, 16, 20, 128, 0x9E);    -- to Upper Delkfutt's Tower
    end
end;
