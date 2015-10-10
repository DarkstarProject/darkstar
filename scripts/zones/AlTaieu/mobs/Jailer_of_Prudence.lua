-----------------------------------
-- Area: Al'Taieu
-- NM:  Jailer of Prudence
-- IDs: 16912846, 16912847
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Jailer_of_Prudence
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/AlTaieu/mobIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_2HOUR_MULTI, 1);
    mob:setMobMod(MOBMOD_NO_DROPS, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0); -- Mouth closed
    mob:addStatusEffectEx(EFFECT_FLEE,0,100,0,60);
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

-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobskill -- When this functionlity is added, this should work.
-----------------------------------

-- function onUseAbility(mob,target,ability)

    -- if (ability:getID() == 437) then -- Perfect Dodge
        -- mob:addStatusEffectEx(EFFECT_FLEE,0,100,0,30);
    -- else        
        -- if (mob:getID() == PrudenceOne and GetMobAction(PrudenceTwo) > 0 and GetMobAction(PrudenceTwo) ~= ACTION_SLEEP and GetMobAction(PrudenceTwo) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceTwo):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceTwo):useMobAbility(ability:getID());
            -- end            
        -- elseif (mob:getID() == PrudenceTwo and GetMobAction(PrudenceOne) > 0 and GetMobAction(PrudenceOne) ~= ACTION_SLEEP and GetMobAction(PrudenceOne) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceOne):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceOne):useMobAbility(ability:getID());
            -- end
        -- end
    -- end
-- end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local firstPrudence     = GetMobByID(PrudenceOne);
    local secondPrudence    = GetMobByID(PrudenceTwo);
    if (mob:getID() == PrudenceOne) then
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