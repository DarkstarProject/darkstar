-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Effigy
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, ValkurmQuadavList);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    if ( mobID == 16937233) then --hp
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
    end
end;
