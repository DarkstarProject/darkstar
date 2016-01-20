-----------------------------------
-- Area: Buburimu Peninsula
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Buburimu_Peninsula/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (npc:getID() == 17261155) then
        player:messageSpecial(SIGN_5);    
    elseif (npc:getID() == 17261156) then
        player:messageSpecial(SIGN_4);            
    elseif (npc:getID() == 17261157) then
        player:messageSpecial(SIGN_3);
    elseif (npc:getID() == 17261158) then
        player:messageSpecial(SIGN_2);
    elseif (npc:getID() == 17261159) or (npc:getID() == 17261160) or (npc:getID() == 17261161) then
        player:messageSpecial(SIGN_1);            
    end
    
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;