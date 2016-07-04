-----------------------------------
-- Area: Spire of Mea
-- NPC:  Radiant Aureole
-----------------------------------
package.loaded["scripts/zones/Spire_of_Mea/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Spire_of_Mea/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x000E)    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    if (csid==0x000E and option==1) then
        player:setPos(179.92, 35.15, 260.137, 64, 117);        -- To Tahrongi Canyon {R}
    end    
end;