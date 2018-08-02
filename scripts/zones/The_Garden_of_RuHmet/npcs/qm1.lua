-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: ??? (Jailer of Fortitude Spawn)
-- Allows players to spawn the Jailer of Fortitude by trading 12 Ghrah M Chips to a ???.
-- Random positions:
-- !pos -420 0 755
-- !pos -43 0 460
-- !pos -260 0 44.821
-- !pos -580 0 43
-- !pos -796 0 460
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade 12 Ghrah M Chips
    if (GetMobAction(ID.mob.JAILER_OF_FORTITUDE) == 0 and trade:hasItemQty(1872,12) and trade:getItemCount() == 12) then
        local qm1 = GetNPCByID(ID.npc.JAILER_OF_FORTITUDE_QM);
        -- Complete the trade
        player:tradeComplete();
        -- Hide the NPC, will become unhidden after Jailer of Fortitude despawns
        qm1:setStatus(dsp.status.DISAPPEAR);
        -- Change MobSpawn to ???'s pos.
        GetMobByID(ID.mob.JAILER_OF_FORTITUDE):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        -- Change spawn point of pets to be at the ???'s pos as well
        GetMobByID(ID.mob.KFGHRAH_WHM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        GetMobByID(ID.mob.KFGHRAH_BLM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        -- Spawn Jailer of Fortitude
        SpawnMob(ID.mob.JAILER_OF_FORTITUDE):updateClaim(player);
        SpawnMob(ID.mob.KFGHRAH_WHM):updateClaim(player);
        SpawnMob(ID.mob.KFGHRAH_BLM):updateClaim(player);
    end
end;

function onTrigger(player,npc)

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
