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
    player:startEvent(0x00c8)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    if (csid == 0x00c8 and option == 1) then
        player:setPos(380,0,147,192,88);
    end
end;
