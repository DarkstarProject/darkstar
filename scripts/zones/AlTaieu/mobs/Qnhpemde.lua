-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'hpemde
-- Jailor of Love Pet version
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(6); -- Mouth Closed
end;

function onMobFight(mob, target)
    local changeTime = mob:getLocalVar("changeTime");

    if (mob:AnimationSub() == 6 and mob:getBattleTime() - changeTime > 30) then
        mob:AnimationSub(3); -- Mouth Open
        mob:addMod(dsp.mod.ATTP, 100);
        mob:addMod(dsp.mod.DEFP, -50);
        mob:addMod(dsp.mod.DMGMAGIC, -50);
        mob:setLocalVar("changeTime", mob:getBattleTime());

    elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > 30) then
        mob:AnimationSub(6); -- Mouth Closed
        mob:addMod(dsp.mod.ATTP, -100);
        mob:addMod(dsp.mod.DEFP, 50);
        mob:addMod(dsp.mod.DMGMAGIC, 50);
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE);
    local HPEMDES = JoL:getLocalVar("JoL_Qn_hpemde_Killed");
    JoL:setLocalVar("JoL_Qn_hpemde_Killed", HPEMDES+1);
end;