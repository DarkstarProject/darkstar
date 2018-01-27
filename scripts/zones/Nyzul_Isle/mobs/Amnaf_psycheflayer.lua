-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Amnaf Psycheflayer
-----------------------------------
require("scripts/zones/Nyzul_Isle/IDs");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    -- mob:setMobMod(MOBMOD_AUTO_SPIKES, 1);
end;

function onMobSpawn(mob)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        mob:showText(mob,NyzulIsle.text.WHEEZE);
    end);
end;

function onMobEngaged(mob,target)
    local allies = mob:getInstance():getAllies();
    for i,v in pairs(allies) do
        v:setLocalVar("ready",1);
    end
    mob:showText(mob,NyzulIsle.text.CANNOT_LET_YOU_PASS);
end;

function onMobFight(mob,target)
end;

--[[
function onSpikesDamage(mob,target,damage)
    -- Amnaf's Ice Spikes from blm spell will process first on retail.
    -- In battleutils.cpp the spike effect is checked before trying to process onSpikesDamage()
    -- thus no status effect = no proc, but 2 spike effects can't coexist..
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
        return SUBEFFECT_CURSE_SPIKES, msgBasic.STATUS_SPIKES, EFFECT_CURSE_I;
    end
end;
]]

function onSpellPrecast(mob, spell)
    mob:showText(mob,NyzulIsle.text.PHSHOOO);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        mob:showText(mob,NyzulIsle.text.NOT_POSSIBLE);
    end
end;

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 2);
end;
