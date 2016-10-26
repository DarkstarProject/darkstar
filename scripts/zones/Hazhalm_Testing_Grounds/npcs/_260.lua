-----------------------------------
-- Area: Hazhalm Testing Grounds
-- NPC: Entry Gate (TOAU-36)
-----------------------------------
package.loaded["scripts/zones/Hazhalm_Testing_Grounds/TextIDs"] = nil;

-----------------------------------

require("scripts/zones/Hazhalm_Testing_Grounds/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == GAZE_OF_THE_SABOTEUR and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(7);
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

    if (csid == 7) then
        player:completeMission(TOAU,GAZE_OF_THE_SABOTEUR);
        player:setVar("AhtUrganStatus",0);
        player:setTitle(EMISSARY_OF_THE_EMPRESS);
        player:addKeyItem(LUMINIAN_DAGGER);
        player:messageSpecial(KEYITEM_OBTAINED,LUMINIAN_DAGGER);
        player:addMission(TOAU,PATH_OF_BLOOD);
    end

end;
