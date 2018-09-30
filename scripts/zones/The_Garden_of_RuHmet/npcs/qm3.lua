-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: ??? (Jailer of Faith Spawn)
-- Allows players to spawn the Jailer of Faith by trading 1 High-Quality Euvhi Organ to a ???.
-- !pos -260 0 -645
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    --Trade 1 High-Quality Euvhi Organ
    if (GetMobAction(ID.mob.JAILER_OF_FAITH) == 0 and trade:hasItemQty(1899,1) and trade:getItemCount() == 1) then
        local qm3 = GetNPCByID(ID.npc.JAILER_OF_FAITH_QM);
        player:tradeComplete();
        -- Hide the ???
        qm3:setStatus(dsp.status.DISAPPEAR);
        -- Change MobSpawn to ???'s pos.
        GetMobByID(ID.mob.JAILER_OF_FAITH):setSpawn(qm3:getXPos(),qm3:getYPos(),qm3:getZPos());
        -- Spawn Jailer of Faith
        SpawnMob(ID.mob.JAILER_OF_FAITH):updateClaim(player);
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
