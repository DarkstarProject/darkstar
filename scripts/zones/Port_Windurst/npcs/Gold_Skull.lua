-----------------------------------
--	Area: Port Windurst
--	NPC:  Gold Skull
--	Mission NPC
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
	
    if (pNation == (BASTOK)) then 
        -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
        if (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 11 and player:hasKeyItem(KINDRED_REPORT)) then
            player:startEvent(0x0044);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 9) then
            player:startEvent(0x0039);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 8) then
            player:showText(npc,GOLD_SKULL_DIALOG + 27);
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 7) then 
            player:startEvent(0x003e);
        -- Bastok Mission 2-3 Part I - Windurst > San d'Oria THE_EMISSARY_WINDURST2		
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 6) then
            player:showText(npc,GOLD_SKULL_DIALOG);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 4 and player:hasKeyItem(SWORD_OFFERING)) then
            player:startEvent(0x0036);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 3 and player:hasKeyItem(SWORD_OFFERING)) then
            player:startEvent(0x0035);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 2) then 
            player:startEvent(0x0032);
        else
            player:startEvent(0x002b);
        end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0035) then
        player:addKeyItem(DULL_SWORD);
        player:messageSpecial(KEYITEM_OBTAINED,DULL_SWORD);
        player:setVar("MissionStatus",4);
        player:delKeyItem(SWORD_OFFERING);
    end	
end;