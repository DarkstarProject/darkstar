-----------------------------------
-- Area: LaLoff_Amphitheater
-- NPC:  qm0 (warp player outside after they win fight)
-------------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/LaLoff_Amphitheater/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(12);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("onUpdate CSID: %u",csid);
-- printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);    
    if (csid == 12 and option == 1) then
        player:setPos(0.049,-42.088,469.093,74,130);
    end
end;