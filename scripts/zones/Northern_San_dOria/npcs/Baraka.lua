-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Baraka
-- Involved in Missions 2-3
-- @zone 231
-- @pos 36 -2 -2
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
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
    local pNation = player:getNation();
    local currentMission = player:getCurrentMission();
    local MissionStatus = player:getVar("MissionStatus");
	
    if (pNation == (BASTOK)) then
        -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
        if (currentMission == THE_EMISSARY and MissionStatus == 2) then
            player:showText(npc,11141);	
        elseif (currentMission == THE_EMISSARY and MissionStatus == 1) then
            player:startEvent(0x0245);
        end
    elseif (pNation == (SANDORIA) and currentMission(BASTOK) ~= 255) then
        player:startEvent(0x0243);
    elseif (pNation == (WINDURST) and currentMission(BASTOK) ~= 255) then
        player:startEvent(0x0244);
    else
        player:startEvent(0x021b);
    end	
end;
-- Baraka 0x0245  0x021b  0x0243  0x0244
-- Danngogg 0x021c 
-- Yevgeny, I.M. 0x7ff9
-- Shakir 0x021a  0x022c
-- Helaku 0x0217  0x021d  0x0218  0x021e  0x021f  0x0219  0x0221  0x022d  0x025b  0x02a4
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

    if (csid == 0x0245) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
    end	
end;