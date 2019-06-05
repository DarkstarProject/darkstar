-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Effigy
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    if ( mobID == 16937233) then --hp
        player:messageBasic(dsp.msg.basic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
    end
end;
