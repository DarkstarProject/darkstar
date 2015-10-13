-----------------------------------
--  Area: Al'Taieu
--  NPC:  Auroral Updraft
--  Type: Standard NPC
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local Auroral_Offset = 16912902;
    local npcID = npc:getID();

    if (npcID == Auroral_Offset) then
        player:startEvent(0x0096);
    elseif (npcID == Auroral_Offset+1) then
        player:startEvent(0x009B);
    elseif (npcID == Auroral_Offset+2) then
        player:startEvent(0x009B);
    elseif (npcID == Auroral_Offset+3) then
        player:startEvent(0x009B);
    elseif (npcID == Auroral_Offset+4) then
        player:startEvent(0x009B);
    elseif (npcID == Auroral_Offset+5) then
        player:startEvent(0x009B);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if (csid == 0x009B) and option == 1 then
        player:setPos(-25,-1 ,-620 ,208 ,33);
    elseif (csid == 0x0096) and option == 1 then
        player:setPos(611.931, 132.787, 773.427, 192, 32); -- To Sealion's Den {R}
    end 

end;
