-----------------------------------
-- Area: Den of Rancor
--  NPC: Switch
-- !pos -56 45 40 160
-----------------------------------
require("scripts/zones/Den_of_Rancor/MobIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getZPos() > 35 then
        GetNPCByID(RANCOR_DROP_GATE):openDoor() -- drop gate to Sacrificial Chamber
    end
end