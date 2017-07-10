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

    if (npc:getID() == 17261165) then
        player:messageSpecial(SIGN_5);    
    elseif (npc:getID() == 17261166) then
        player:messageSpecial(SIGN_4);            
    elseif (npc:getID() == 17261167) then
        player:messageSpecial(SIGN_3);
    elseif (npc:getID() == 17261168) then
        player:messageSpecial(SIGN_2);
    elseif (npc:getID() == 17261169) or (npc:getID() == 17261170) or (npc:getID() == 17261171) then
        player:messageSpecial(SIGN_1);            
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;