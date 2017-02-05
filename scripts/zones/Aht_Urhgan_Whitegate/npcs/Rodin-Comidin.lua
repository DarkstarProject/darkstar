-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Rodin-Comidin
-- Standard Info NPC
-- Involved in Missions: TOAU-41
-- @pos 17.205 -5.999 51.161 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == PATH_OF_DARKNESS and player:hasKeyItem(NYZUL_ISLE_ROUTE) == false) then
        player:startEvent(3141,0,0,0,0,0,0,0,0,0);
    elseif (player:getCurrentMission(TOAU) == LIGHT_OF_JUDGMENT) then
        player:startEvent(3137,0,0,0,0,0,0,0,0,0);
    else
        player:startEvent(0x0299);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);

    if (csid == 3137) then
        player:completeMission(TOAU,LIGHT_OF_JUDGMENT);
        player:addMission(TOAU,PATH_OF_DARKNESS);
    end

    if (csid == 3137 or csid == 3141) then
        player:addKeyItem(NYZUL_ISLE_ROUTE);
        player:messageSpecial(KEYITEM_OBTAINED,NYZUL_ISLE_ROUTE);
    end

end;

