-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--  NPC:
-- Involved In Mission:
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local cardian_ids = {}
    for cardians = ID.mob.CUSTOM_CARDIAN_OFFSET + 0, ID.mob.CUSTOM_CARDIAN_OFFSET + 13, 1 do
        table.insert(cardian_ids, cardian)
    end

    local funcPerMob = function(mob)
    end
    
    local params = {radius=5, claim=true, hide=0, func=funcPerMob}

    npcUtil.popFromQM(player, npc, cardian_ids, params)

    -- TODO: Finish this fight, debug for now
    if
        player:getCurrentMission(AMK) == dsp.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE and
        not player:hasKeyItem(dsp.ki.RIPE_STARFRUIT)
    then
        npcUtil.giveKeyItem(player, dsp.ki.RIPE_STARFRUIT)
        player:addExp(500)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end