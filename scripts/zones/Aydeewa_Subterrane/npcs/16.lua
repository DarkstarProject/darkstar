-----------------------------------
-- Area: Aydeewa Subterrane
-- NPC: Blank (TOAU-20 Cutscene)
-- @pos -298 36 -38 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Aydeewa_Subterrane/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == TEAHOUSE_TUMULT and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(11);
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

    if(csid == 11) then
        player:completeMission(TOAU,TEAHOUSE_TUMULT);
        player:setVar("AhtUrganStatus",0);
        player:addMission(TOAU,FINDERS_KEEPERS);
    end
end;

