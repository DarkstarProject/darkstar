-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Mulaujeant
-- Involved in Quests: Missionary Man
-- @zone 231
-- @pos -175 0 181
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    starttime = player:getVar("MissionaryMan_date");
    MissionaryManVar = player:getVar("MissionaryManVar");
    
    if (MissionaryManVar == 2) then 
        player:startEvent(0x02ba,0,1146); -- Start statue creation
    elseif (MissionaryManVar == 3 and (starttime == realday or player:needToZone() == true)) then 
        player:startEvent(0x02bb); -- During statue creation
    elseif (MissionaryManVar == 3 and starttime ~= realday and player:needToZone() == false) then 
        player:startEvent(0x02bc); -- End of statue creation
    elseif (MissionaryManVar == 4) then 
        player:startEvent(0x02bd); -- During quest (after creation)
    else
        player:startEvent(0x02b9); -- Standard dialog
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
    if (csid == 0x02ba) then 
        player:setVar("MissionaryManVar",3);
        player:setVar("MissionaryMan_date", os.date("%j")); -- %M for next minute, %j for next day
        player:delKeyItem(RAUTEINOTS_PARCEL);
        player:needToZone(true);
        
    elseif (csid == 0x02bc) then 
        player:setVar("MissionaryManVar",4);
        player:setVar("MissionaryMan_date", 0); 
        player:addKeyItem(SUBLIME_STATUE_OF_THE_GODDESS);
        player:messageSpecial(KEYITEM_OBTAINED,SUBLIME_STATUE_OF_THE_GODDESS);
    end
end;

