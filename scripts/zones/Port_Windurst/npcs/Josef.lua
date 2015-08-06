-----------------------------------
--	Area: Port Windurst
--	NPC:  Josef
--	Standard Info Npc
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");

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
        elseif (currentMission == THE_EMISSARY_SANDORIA2 and MissionStatus == 10 and player:hasKeyItem(KINDRED_REPORT)) then
            player:startEvent(0x0046);
        elseif (currentMission == THE_EMISSARY_WINDURST and MissionStatus == 2) then 
            player:startEvent(0x0034);
	else
    player:startEvent(0x002d);
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
end;



