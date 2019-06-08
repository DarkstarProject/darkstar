-----------------------------------
-- Area: Quicksand Caves
-- NPC: Goblin Geologist
-- Type: Mission NPC: AMK 8
-- !pos -737.000 -11.125 -550.000 208
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local laborOfLove = player:getCurrentMission(AMK) == dsp.mission.id.amk.RESCUE_A_MOOGLES_LABOR_OF_LOVE
    local baresHerFangs = player:addMission(AMK,dsp.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
    local hasQuicksandMap = player:hasKeyItem(dsp.ki.MAP_OF_THE_QUICKSAND_CAVES)
    local hasAllStones = player:hasKeyItem(dsp.ki.STONE_OF_SURYA) and
                         player:hasKeyItem(dsp.ki.STONE_OF_CHANDRA) and
                         player:hasKeyItem(dsp.ki.STONE_OF_MANGALA) and
                         player:hasKeyItem(dsp.ki.STONE_OF_BUDHA) and
                         player:hasKeyItem(dsp.ki.STONE_OF_BRIHASPATI) and
                         player:hasKeyItem(dsp.ki.STONE_OF_SHUKRA) and
                         player:hasKeyItem(dsp.ki.STONE_OF_SHANI) and
                         player:hasKeyItem(dsp.ki.STONE_OF_RAHU) and
                         player:hasKeyItem(dsp.ki.STONE_OF_KETU)
    local hasTalisman = player:hasKeyItem(dsp.ki.NAVARATNA_TALISMAN)

    if not laborOfLove or baresHerFangs or hasTalisman then return end

    -- TODO: All logic is here because csid and option are not set on eventFinish?
    if hasAllStones then
        player:startEvent(100, 1)

        player:delKeyItem(dsp.ki.STONE_OF_SURYA)
        player:delKeyItem(dsp.ki.STONE_OF_CHANDRA)
        player:delKeyItem(dsp.ki.STONE_OF_MANGALA)
        player:delKeyItem(dsp.ki.STONE_OF_BUDHA)
        player:delKeyItem(dsp.ki.STONE_OF_BRIHASPATI)
        player:delKeyItem(dsp.ki.STONE_OF_SHUKRA)
        player:delKeyItem(dsp.ki.STONE_OF_SHANI)
        player:delKeyItem(dsp.ki.STONE_OF_RAHU)
        player:delKeyItem(dsp.ki.STONE_OF_KETU)

        npcUtil.giveKeyItem(player, dsp.ki.NAVARATNA_TALISMAN)

    elseif hasQuicksandMap then
        player:startEvent(100, 2)

        -- Start of stone hunt
    else
        player:startEvent(100, 0)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
