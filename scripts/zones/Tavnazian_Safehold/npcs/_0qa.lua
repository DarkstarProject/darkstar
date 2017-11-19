-----------------------------------
-- Area: Tavnazian Safehold
-- NPC:  walnut door
-- Involved in mission 2-4
-- !pos 111 -41 41 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Tavnazian_Safehold/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == AN_ETERNAL_MELODY and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(104);
    elseif (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(111);
    elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus")==4) then
        player:startEvent(115);
    elseif (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")==5) then
        player:startEvent(543);
    end
    return 1;
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

    if (csid == 104 or csid == 111) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 115) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,CHAINS_AND_BONDS);
        player:addMission(COP,FLAMES_IN_THE_DARKNESS);
    elseif (csid == 543) then
        player:setVar("PromathiaStatus",6);
    end

end;