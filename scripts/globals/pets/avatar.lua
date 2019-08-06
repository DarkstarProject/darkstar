-----------------------------------
--  PET: Elementals
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
require("scripts/globals/weather")

local spirits =
{
    -- TODO: In an ideal world, we'd just use the entity's element.
    -- But at the moment DSP has inconsistencies in how it orders magical
    -- elements, such that the element value in the entity's SQL record
    -- doesn't correspond with the entry in dsp.magic.element.ELEMENT.
    -- We don't want to hinder our abstraction of a spirit, so all a spirit's
    -- internal references to elements are based on magical element.

    -- Therefore, we need to map the spirit to its element by family.
    -- Listng ordered by magical element; the ordering of spirit families
    -- should probably be fixed in the SQL DB as well.
    --[102] = dsp.magic.element.FIRE,
    --[103] = dsp.magic.element.ICE,
    --[99]  = dsp.magic.element.WIND,
    --[101] = dsp.magic.element.EARTH,
    --[105] = dsp.magic.element.LIGHTNING,
    --[106] = dsp.magic.element.WATER,
    [104] = require("scripts/globals/pets/spirits/light_spirit"),
    --[100] = dsp.magic.element.DARK
}

function onMobDeath(mob, player, isKiller)

end

function onMobEngaged(pet)
    -- return incoming delay value to return to legacy/monster mode    
    local delay = spirits[pet:getFamily()].getEngageDelay(pet, delay)
    pet:setMobMod(MOBMOD_MAGIC_COOL, delay/1000)
end

-- on each fight round, adjust delay to match smn skill
function onMobFight(pet, target)
    -- return the value provided in delay to resume legacy monster mode
    local delay = pet:getMobMod(MOBMOD_MAGIC_COOL) * 1000
    delay = spirits[pet:getFamily()].getCastingTime(pet)
    pet:setMobMod(MOBMOD_MAGIC_COOL, delay/1000)
end

-- return true if you are casting a spell, otherwise return false
function onMobRoam(pet, msSinceLastCast)
    local msSinceLastCast = pet:getLastMagicTime()
	spirits[pet:getFamily()].castSpell(pet, msSinceLastCast)
	return
end
