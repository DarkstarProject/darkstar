-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: ???
-- Note: Spawns Ix'Aern (MNK)
-- !pos 460 0 540
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");
require("scripts/zones/Grand_Palace_of_HuXzoi/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local nm = GetMobByID(IXAERN_MNK);
    
    if (not nm:isSpawned()) then
        local chance = 0; -- percent chance that an item will drop.

        if (npcUtil.tradeHas(trade, {{1900,3}})) then
            chance = 100;
        elseif (npcUtil.tradeHas(trade, {{1900,2}})) then
            chance = 66;
        elseif (npcUtil.tradeHas(trade, 1900)) then
            chance = 33;
        end

        if (chance > 0) then
            player:confirmTrade();
            npc:setLocalVar("[SEA]IxAern_DropRate", chance); -- adjusts drops in IxAern (MNK)'s onMobSpawn.
            npc:setStatus(STATUS_DISAPPEAR);

            -- spawn Ix'Aern (MNK) and minions
            nm:setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos());
            SpawnMob(IXAERN_MNK):updateClaim(player);
            if (chance >= 66) then
                GetMobByID(IXAERN_MNK + 1):setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos()-4);
                SpawnMob(IXAERN_MNK + 1):updateClaim(player);
            end
            if (chance == 100) then
                GetMobByID(IXAERN_MNK + 2):setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos()+4);
                SpawnMob(IXAERN_MNK + 2):updateClaim(player);
            end

        end;
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
