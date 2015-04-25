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
    mob:setMod(MOBMOD_MAIN_2HOUR, 1);
    -- Change animation to humonoid
    mob:AnimationSub(1);
    -- Set the damage resists
    -- According to https://www.bg-wiki.com/bg/Jailer_of_Fortitude
    -- Has very high resistance to melee damage (approximately 95%).
    -- Set damage resistance to match that.
    mob:setMod(MOD_HTHRES,50);
    mob:setMod(MOD_SLASHRES,50);
    mob:setMod(MOD_PIERCERES,50);
    mob:setMod(MOD_IMPACTRES,50);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob)
    -- Remove Chainspell / Manafont if we gave it to him for the reflect.
    if (mob:hasStatusEffect(EFFECT_CHAINSPELL)) then
        mob:delStatusEffect(EFFECT_CHAINSPELL);
    end
    if (mob:hasStatusEffect(EFFECT_MANAFONT)) then
        mob:delStatusEffect(EFFECT_MANAFONT);
    end
end;

-----------------------------------
-- onMagicHit Action
-----------------------------------

function onMagicHit(caster,target,spell)
    -- Throttle the mimics to once every five seconds.
    local reflectTime = target:getLocalVar("reflectTime");
    if (target:getBattleTime() - reflectTime > 5) then
        if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= SPELLGROUP_BLUE ) then
            -- Spells that are mimicked should be instantly casted.
            target:addStatusEffect(EFFECT_CHAINSPELL,0,0,0);
            target:addStatusEffect(EFFECT_MANAFONT,0,0,0);
            target:castSpell(spell:getID(), caster);
            target:setLocalVar("reflectTime", target:getBattleTime());
        end
    end
    
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
