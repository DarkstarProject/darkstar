-----------------------------------
-- Area: Metalworks
-- NPC:  Alois
-- Involved in Missions: Wading Beasts
-- !pos 96 -20 14 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getCurrentMission(BASTOK) == WADING_BEASTS and trade:hasItemQty(4362,1) and trade:getItemCount() == 1) then -- Trade Lizard Egg
        if (player:hasCompletedMission(BASTOK,WADING_BEASTS) == false) then
            player:startEvent(372);
        else
            player:startEvent(373);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 0) then
player:startEvent(773);
elseif (player:getVar("BASTOK91") == 1) then
player:startEvent(774);
elseif (player:getVar("BASTOK91") == 3) then
player:startEvent(775);
elseif (player:getVar("BASTOK91") == 4) then
player:startEvent(776);
else
player:startEvent(370);
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

    if (csid == 372 or csid == 373) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 773) then
    player:setVar("BASTOK91",1);
    elseif (csid == 776) then
    player:setVar("BASTOK91",0);
    player:completeMission(BASTOK,THE_SALT_OF_THE_EARTH);
    player:addRankPoints(1500);
    player:setVar("OptionalcsCornelia",1);
    end

end;