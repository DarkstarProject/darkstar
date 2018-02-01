-----------------------------------
-- Area: Western Adoulin
--  NPC: Shipilolo
-- Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
--                        'Fertile Ground'
--                        'The Old Man and the Harpoon'
--                        'Wayward Waypoints'
--  @zone 256
-- !pos 84 0 -60
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TOMATH = player:getQuestStatus(ADOULIN, THE_OLD_MAN_AND_THE_HARPOON);
    local Fertile_Ground = player:getQuestStatus(ADOULIN, FERTILE_GROUND);
    local Wayward_Waypoints = player:getQuestStatus(ADOULIN, WAYWARD_WAYPOINTS);
    Wayward_Waypoints = (Wayward_Waypoints == QUEST_ACCEPTED) and (player:getVar("WW_Need_Shipilolo") > 0)
    local ACSP = player:getQuestStatus(ADOULIN, A_CERTAIN_SUBSTITUTE_PATROLMAN);
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((TOMATH == QUEST_ACCEPTED) and player:hasKeyItem(BROKEN_HARPOON)) then
            -- Progresses Quest: 'The Old Man and the Harpoon'
            player:startEvent(2543);
        elseif ((Fertile_Ground == QUEST_ACCEPTED) and (not player:hasKeyItem(BOTTLE_OF_FERTILIZER_X))) then
            -- Progresses Quest: 'Fertile Ground'
            player:startEvent(2850);
        elseif (Wayward_Waypoints and (not player:hasKeyItem(WAYPOINT_RECALIBRATION_KIT))) then
            -- Progresses Quest: 'Wayward Waypoints'
            player:startEvent(79);
        elseif ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 5)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(2557);
        else
            -- Standard dialogue
            player:startEvent(535);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(526);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2543) then
        -- Progresses Quest: 'The Old Man and the Harpoon'
        player:delKeyItem(BROKEN_HARPOON);
        player:addKeyItem(EXTRAVAGANT_HARPOON);
        player:messageSpecial(KEYITEM_OBTAINED, EXTRAVAGANT_HARPOON);
    elseif (csid == 2850) then
        -- Progresses Quest: 'Fertile Ground'
        player:addKeyItem(BOTTLE_OF_FERTILIZER_X);
    elseif (csid == 79) then
        player:addKeyItem(WAYPOINT_RECALIBRATION_KIT);
        player:setVar("WW_Need_Shipilolo", 0);
    elseif (csid == 2557) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 6);
    end
end;
