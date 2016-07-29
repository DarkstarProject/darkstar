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
    player:startEvent(0x0C);
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
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    if (csid == 0x0C and option == 1) then
        player:setPos(291.459,-42.088,-401.161,163,130);
    end
end;