-----------------------------------
-- Area:  King Ranperre's Tomb
-- NPC:   ??? (qm1)
-- Notes: Used to teleport down the stairs
-- @pos -81 -1 -97 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
    player:startEvent(0x000a);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

-- TODO: Missing teleport-animation. Might be a core issue as to why it wont display. 

    if (csid == 0x000a and option == 100) then
        player:setPos(-81.5,7.297,-127.919,71);
    end    

end;