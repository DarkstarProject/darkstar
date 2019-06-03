-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--  NPC:
-- Involved In Mission:
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    
    for Custom_Cardian = ID.mob.CUSTOM_CARDIAN_OFFSET + 0, ID.mob.CUSTOM_CARDIAN_OFFSET + 13, 1 do
        -- TODO: Spawn with mods, depending on key items
        local mob = SpawnMob(Custom_Cardian)
        mob:updateClaim(player)
        mob:updateEnmity(player)
    end

    -- TODO: Finish this fight, debug for now
    if
        player:getCurrentMission(AMK) == dsp.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE and
        not player:hasKeyItem(dsp.ki.RIPE_STARFRUIT)
    then
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.RIPE_STARFRUIT)
        player:addKeyItem(dsp.ki.RIPE_STARFRUIT)
        player:addExp(500)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end