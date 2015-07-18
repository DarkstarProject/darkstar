-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Fortitude
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Give it two hour
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
	mob:setMobMod(MOBMOD_2HOUR_MULTI, 1);
    -- Change animation to humanoid w/ prismatic core
    mob:AnimationSub(1);
    mob:setModelId(1169);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob)
    local delay = mob:getLocalVar("delay");
    local LastCast = mob:getLocalVar("LAST_CAST");
    local spell = mob:getLocalVar("COPY_SPELL");

    if (mob:getBattleTime() - LastCast > 30) then
        mob:setLocalVar("COPY_SPELL", 0);
        mob:setLocalVar("delay", 0);
    end;

    if (IsMobDead(16921016)==false or IsMobDead(16921017)==false) then -- check for kf'ghrah
        if (spell > 0 and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
            if (delay >= 3) then
                mob:castSpell(spell);
                mob:setLocalVar("COPY_SPELL", 0);
                mob:setLocalVar("delay", 0);
            else
                mob:setLocalVar("delay", delay+1);
            end;
        end;
    end;
end;

-----------------------------------
-- onMagicHit Action
-----------------------------------

function onMagicHit(caster,target,spell)
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= SPELLGROUP_BLUE ) then
        -- Handle mimicked spells
        target:setLocalVar("COPY_SPELL", spell:getID());
        target:setLocalVar("LAST_CAST", target:getBattleTime());
        target:setLocalVar("reflectTime", target:getBattleTime());
        target:AnimationSub(1);
    end;

    return 1;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, npc)
    -- Despawn the pets if alive
    DespawnMob(Kf_Ghrah_WHM);
    DespawnMob(Kf_Ghrah_BLM);
    -- Set 15 mins respawn
    local qm1 = GetNPCByID(Jailer_of_Fortitude_QM);
    qm1:hideNPC(900);

    -- Move it to a random location
    local qm1position = math.random(1,5);
    qm1:setPos(Jailer_of_Fortitude_QM_POS[qm1position][1], Jailer_of_Fortitude_QM_POS[qm1position][2], Jailer_of_Fortitude_QM_POS[qm1position][3]);
end;
