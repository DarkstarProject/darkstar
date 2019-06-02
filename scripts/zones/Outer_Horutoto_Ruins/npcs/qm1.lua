-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC:
-- Involved In Mission:
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    
    for Custom_Cardian = 17572204 + 0, 17572204 + 14, 1 do
        -- TODO: Spawn with mods, depending on key items
        -- SpawnMob(Custom_Cardian);
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