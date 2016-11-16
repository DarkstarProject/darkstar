-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Amnaf Psycheflayer
-----------------------------------
require("scripts/zones/Nyzul_Isle/IDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- mob:setMobMod(MOBMOD_AUTO_SPIKES, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        mob:showText(mob,NyzulIsle.text.WHEEZE);
    end);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    local allies = mob:getInstance():getAllies();
    for i,v in pairs(allies) do
        v:setLocalVar("ready",1);
    end
    mob:showText(mob,NyzulIsle.text.CANNOT_LET_YOU_PASS);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onSpikesDamage
-- Amnaf's Ice Spikes from blm spell will process first on retail.
-- In battleutils.cpp the spike effect is checked before trying to process onSpikesDamage()
-- thus no status effect = no proc, but 2 spike effects can't coexist..
-----------------------------------
--[[
function onSpikesDamage(mob,target,damage)
    local resist = getEffectResistance(target, EFFECT_CURSE_I);
    local rnd = math.random (1,100);
    -- This res check is a little screwy till we get DSP's resistance handling closer to retail.
    -- looks like applyResistanceAddEffect() doesn't even handle status resistance, only elemental.
    if (resist > rnd or rnd <= 20) then
        return 0, 0, 0;
    else
        -- Estimated from https://youtu.be/7jsXnwkqMM4?t=5m42s
        -- And yes it does overwrite itself
        target:addStatusEffect(EFFECT_CURSE_I, 10, 0, 10);
        return SUBEFFECT_CURSE_SPIKES, MSGBASIC_STATUS_SPIKES, EFFECT_CURSE_I;
    end
end;
]]

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
    mob:showText(mob,NyzulIsle.text.PHSHOOO);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        mob:showText(mob,NyzulIsle.text.NOT_POSSIBLE);
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 2);
end;
