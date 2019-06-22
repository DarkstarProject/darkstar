-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Mayuyu
-- Legion NPC
-- !pos 240 24.399 468
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local legendary = player:hasTitle(dsp.title.LEGENDARY_LEGIONNAIRE) and 1 or 0
    local capacity =
        (player:hasKeyItem(dsp.ki.LEGION_TOME_PAGE_MINIMUS) and 1 or 0) +
        (player:hasKeyItem(dsp.ki.LEGION_TOME_PAGE_MAXIMUS) and 2 or 0)

    player:startEvent(8008, 0, legendary, capacity)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- Event needs work, also the Legion Pass item is "tagged" via fields not yet implemented in core.
end