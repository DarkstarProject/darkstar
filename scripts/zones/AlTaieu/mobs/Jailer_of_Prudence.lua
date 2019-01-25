-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Prudence
-- IDs: 16912846, 16912847
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Jailer_of_Prudence
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.NO_DROPS, 1);
end;

function onMobSpawn(mob)
    mob:AnimationSub(0); -- Mouth closed
    mob:addStatusEffectEx(dsp.effect.FLEE,0,100,0,60);
    mob:setMod(dsp.mod.TRIPLE_ATTACK, 20);
    mob:setMod(dsp.mod.REGEN, 10);
    mob:addMod(dsp.mod.BINDRES, 30);
    mob:addMod(dsp.mod.SLOWRES, 10);
    mob:addMod(dsp.mod.BLINDRES, 10);
    mob:addMod(dsp.mod.SLEEPRES, 30);
    mob:addMod(dsp.mod.PETRIFYRES, 10);
    mob:addMod(dsp.mod.GRAVITYRES, 10);
    mob:addMod(dsp.mod.LULLABYRES, 30);
end;

function onMobDisEngage(mob, target)
end;

--[[ onMobskill -- When this functionlity is added, this should work.
function onUseAbility(mob,target,ability)
    local mobId = mob:getID()
    local pOne = GetMobByID(ID.mob.JAILER_OF_PRUDENCE_1)
    local pTwo = GetMobByID(ID.mob.JAILER_OF_PRUDENCE_2)
    local pOneAct = pOne:getCurrentAction()
    local pTwoAct = pTwo:getCurrentAction()

    if ability:getID() == 437 then -- Perfect Dodge
        mob:addStatusEffectEx(dsp.effect.FLEE,0,100,0,30)
    elseif mobId == ID.mob.JAILER_OF_PRUDENCE_1 and pTwoAct > 0 and pTwoAct ~= dsp.act.SLEEP and pTwoAct ~= dsp.act.STUN and pTwo:checkDistance(mob) <= 10 then
        pTwo:useMobAbility(ability:getID())
    elseif mobId == ID.mob.JAILER_OF_PRUDENCE_2 and pOneAct > 0 and pOneAct ~= dsp.act.SLEEP and pOneAct ~= dsp.act.STUN and pOne:checkDistance(mob) <= 10 then
        pOne:useMobAbility(ability:getID())
    end
end
--]]

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local firstPrudence     = GetMobByID(ID.mob.JAILER_OF_PRUDENCE_1);
    local secondPrudence    = GetMobByID(ID.mob.JAILER_OF_PRUDENCE_2);
    if (mob:getID() == ID.mob.JAILER_OF_PRUDENCE_1) then
        secondPrudence:setMobMod(dsp.mobMod.NO_DROPS, 0);
        secondPrudence:AnimationSub(3); -- Mouth Open
        secondPrudence:addMod(dsp.mod.ATTP, 100);
        secondPrudence:delMod(dsp.mod.DEFP, -50);
    else
        firstPrudence:setMobMod(dsp.mobMod.NO_DROPS, 0);
        firstPrudence:AnimationSub(3); -- Mouth Open
        firstPrudence:addMod(dsp.mod.ATTP, 100);
        firstPrudence:delMod(dsp.mod.DEFP, -50);
    end;
end;
