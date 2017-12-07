-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Red Canyon
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(200)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    if (csid == 200 and option == 1) then
        player:setPos(380,0,147,192,88);
    end
end;
