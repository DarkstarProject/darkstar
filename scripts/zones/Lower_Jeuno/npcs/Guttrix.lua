-----------------------------------
-- Area: Lower Jeuno
-- NPC: Guttrix
-- Starts and Finishes Quest: The Goblin Tailor
-- @zone: 245
-- @pos -36.010 4.499 -139.714
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

--[[-----------------------------------------------
Description:
    rse = race, { [1] body, [2] hands, [3] legs, [4] feet }
--]]-----------------------------------------------

local rse_map = { 1,{12654,12761,12871,13015}, -- Male Hume
                  2,{12655,12762,12872,13016}, -- Female Hume
                  3,{12656,12763,12873,13017}, -- Male Elvaan
                  4,{12657,12764,12874,13018}, -- Female Elvaan
                  5,{12658,12765,12875,13019}, -- Male Taru-Taru
                  6,{12658,12765,12875,13019}, -- Female Taru-Taru
                  7,{12659,12766,12876,13020}, -- Mithra
                  8,{12660,12767,12877,13021}};-- Galka

function hasRSE(player)
    local rse = 0;
    local race = player:getRace();

    for raceindex = 1, table.getn(rse_map), 2 do
        if (race == rse_map[raceindex]) then --matched race
            for rseindex = 1, table.getn(rse_map[raceindex + 1]), 1 do --loop rse for this race
                if (player:hasItem(rse_map[raceindex+1][rseindex])) then
                    rse = rse + (2 ^ (rseindex - 1));
                end
            end
        end
    end

    return rse;
end;

function getRSE(player, option)
    local race = player:getRace();

    for raceindex = 1, table.getn(rse_map), 2 do
        if (race == rse_map[raceindex]) then --matched race
            return rse_map[raceindex+1][option];
        end
    end

    return -1;
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local pFame = player:getFameLevel(JEUNO);
    local pRace = player:getRace();
    local pLevel = player:getMainLvl();
    local questStatus = player:getQuestStatus(JEUNO,THE_GOBLIN_TAILOR);
    local rseGear = hasRSE(player);
    local rseRace = VanadielRSERace();
    local rseLocation = VanadielRSELocation();

    if (pLevel >= 10 and pFame >= 3) then
        if (rseGear < 15 ) then
            if (questStatus == QUEST_AVAILABLE) then
                player:startEvent(0x2720,rseLocation,rseRace);
            elseif (questStatus >= QUEST_ACCEPTED and player:hasKeyItem(MAGICAL_PATTERN) and rseRace == pRace) then
                player:startEvent(0x2722,rseGear);
            else
                player:startEvent(0x2721,rseLocation,rseRace);
            end
        else
            player:startEvent(0x2723);
        end
    else
        player:startEvent(0x2724);
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
    local questStatus = player:getQuestStatus(JEUNO,THE_GOBLIN_TAILOR);

    if (csid == 0x2720) then
        player:addQuest(JEUNO,THE_GOBLIN_TAILOR);
    elseif (csid == 0x2722 and option >= 1 and option <= 4) then
        local rseGear = getRSE(player,option);

        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,rseGear);
        else
            if (questStatus == QUEST_ACCEPTED) then
                player:addFame(JEUNO, 30);
                player:completeQuest(JEUNO,THE_GOBLIN_TAILOR);
            end

            player:delKeyItem(MAGICAL_PATTERN);
            player:addItem(rseGear);
            player:messageSpecial(ITEM_OBTAINED,rseGear);
        end
    end
end;

