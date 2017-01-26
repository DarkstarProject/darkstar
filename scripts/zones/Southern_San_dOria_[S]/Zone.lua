-----------------------------------
--
-- Zone: Southern_San_dOria_[S] (80)
--
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(103.978,-1,-47.951,158);
    end
    if (prevZone == 81) then
        if (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED and player:getVar("KnotQuiteThere") == 2) then
            cs = 0x003E;
        elseif (player:getQuestStatus(CRYSTAL_WAR, DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getVar("DownwardHelix") == 0) then
            cs = 0x0041;
        elseif (player:getCurrentMission(WOTG) == CAIT_SITH and
               (player:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, A_MANIFEST_PROBLEM) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, BURDEN_OF_SUSPICION) == QUEST_COMPLETED)) then
            cs = 0x0043;
        end
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
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
    if (csid == 0x003E) then
        player:setVar("KnotQuiteThere",3);
    elseif (csid == 0x0041) then
        player:setVar("DownwardHelix",1);
    elseif (csid == 0x0043) then
        player:completeMission(WOTG, CAIT_SITH);
        player:addMission(WOTG, THE_QUEEN_OF_THE_DANCE);
    end
end;