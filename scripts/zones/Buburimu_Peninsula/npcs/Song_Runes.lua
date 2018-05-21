-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Song Runes
--  Finishes Quest: The Old Monument
-- !pos -244 16 -280 118
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/zones/Buburimu_Peninsula/TextIDs")
-----------------------------------

local PARCHMENT = 917
local POETIC_PARCHMENT = 634

function onTrade(player,npc,trade)
    -- THE OLD MONUMENT (parchment)
    if player:getVar("TheOldMonument_Event") == 3 and trade:hasItemQty(PARCHMENT,1) and trade:getItemCount() == 1 then
        player:startEvent(2)
    end
end

function onTrigger(player,npc)
    -- THE OLD MONUMENT
    if player:getVar("TheOldMonument_Event") == 2 then
        player:startEvent(0)
    elseif player:getVar("TheOldMonument_Event") == 3 then
        player:messageSpecial(SONG_RUNES_REQUIRE,917)

    -- DEFAULT DIALOG
    else
        player:messageSpecial(SONG_RUNES_DEFAULT)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 0 then
        player:setVar("TheOldMonument_Event",3)
    elseif csid == 2 then
        player:tradeComplete()
        player:messageSpecial(SONG_RUNES_WRITING,917)
        player:addItem(POETIC_PARCHMENT,1)
        player:messageSpecial(ITEM_OBTAINED, POETIC_PARCHMENT)
        player:completeQuest(JEUNO,THE_OLD_MONUMENT)
        player:addTitle(dsp.title.RESEARCHER_OF_CLASSICS)
        player:addFame(BASTOK,10)
        player:addFame(SANDORIA,10)
        player:addFame(WINDURST,10)
    end
end
