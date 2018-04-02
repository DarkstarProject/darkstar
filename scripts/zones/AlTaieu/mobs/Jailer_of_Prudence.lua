-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Prudence
-- IDs: 16912846, 16912847
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Jailer_of_Prudence
-----------------------------------
require("scripts/zones/AlTaieu/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_2HOUR_MULTI, 1);
    mob:setMobMod(MOBMOD_NO_DROPS, 1);
end;

function onMobSpawn(mob)
    mob:AnimationSub(0); -- Mouth closed
    mob:addStatusEffectEx(dsp.effects.FLEE,0,100,0,60);
    mob:setMod(MOD_TRIPLE_ATTACK, 20);
    mob:setMod(MOD_REGEN, 10);
    mob:addMod(MOD_BINDRES, 30);
    mob:addMod(MOD_SLOWRES, 10);
    mob:addMod(MOD_BLINDRES, 10);
    mob:addMod(MOD_SLEEPRES, 30);
    mob:addMod(MOD_PETRIFYRES, 10);
    mob:addMod(MOD_GRAVITYRES, 10);
    mob:addMod(MOD_LULLABYRES, 30);
end;

function onMobDisEngage(mob, target)
end;

function onMobFight(mob, target)
end;

-- onMobskill -- When this functionlity is added, this should work.
-- function onUseAbility(mob,target,ability)
    -- if (ability:getID() == 437) then -- Perfect Dodge
        -- mob:addStatusEffectEx(dsp.effects.FLEE,0,100,0,30);
    -- else
        -- if (mob:getID() == JAILER_OF_PRUDENCE_1 and GetMobAction(JAILER_OF_PRUDENCE_2) > 0 and GetMobAction(JAILER_OF_PRUDENCE_2) ~= ACTION_SLEEP and GetMobAction(JAILER_OF_PRUDENCE_2) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceTwo):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceTwo):useMobAbility(ability:getID());
            -- end
        -- elseif (mob:getID() == JAILER_OF_PRUDENCE_2 and GetMobAction(JAILER_OF_PRUDENCE_1) > 0 and GetMobAction(JAILER_OF_PRUDENCE_1) ~= ACTION_SLEEP and GetMobAction(PrudenJAILER_OF_PRUDENCE_1eOne) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceOne):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceOne):useMobAbility(ability:getID());
            -- end
        -- end
    -- end
-- end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local firstPrudence     = GetMobByID(JAILER_OF_PRUDENCE_1);
    local secondPrudence    = GetMobByID(JAILER_OF_PRUDENCE_2);
    if (mob:getID() == JAILER_OF_PRUDENCE_1) then
        secondPrudence:setMobMod(MOBMOD_NO_DROPS, 0);
        secondPrudence:AnimationSub(3); -- Mouth Open
        secondPrudence:addMod(MOD_ATTP, 100);
        secondPrudence:delMod(MOD_DEFP, -50);
    else
        firstPrudence:setMobMod(MOBMOD_NO_DROPS, 0);
        firstPrudence:AnimationSub(3); -- Mouth Open
        firstPrudence:addMod(MOD_ATTP, 100);
        firstPrudence:delMod(MOD_DEFP, -50);
    end;
end;
