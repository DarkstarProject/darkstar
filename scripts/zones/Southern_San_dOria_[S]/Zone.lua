-----------------------------------
--
-- Zone: Southern_San_dOria_[S] (80)
--
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/chocobo")
require("scripts/globals/quests");
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (prevZone == dsp.zone.EAST_RONFAURE_S) then
        if (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.KNOT_QUITE_THERE) == QUEST_ACCEPTED and player:getVar("KnotQuiteThere") == 2) then
            cs = 62;
        elseif (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getVar("DownwardHelix") == 0) then
            cs = 65;
        elseif (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.CAIT_SITH and
               (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.WRATH_OF_THE_GRIFFON) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.BURDEN_OF_SUSPICION) == QUEST_COMPLETED)) then
            cs = 67;
        end
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(161,-2,161,94);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 62) then
        player:setVar("KnotQuiteThere",3);
    elseif (csid == 65) then
        player:setVar("DownwardHelix",1);
    elseif (csid == 67) then
        player:completeMission(WOTG, dsp.mission.id.wotg.CAIT_SITH);
        player:addMission(WOTG, dsp.mission.id.wotg.THE_QUEEN_OF_THE_DANCE);
    end
end;