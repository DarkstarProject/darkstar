-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Goblin Replica
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
    if (mobID ==16937283) then --hp
        player:messageBasic(dsp.msg.basic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
    elseif (mobID ==16937284) then --mp
        player:messageBasic(dsp.msg.basic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    end
end;
