--[[
Colibri that copy spells cast on it.

localVar                        default     description
--------                        -------     -----------
[colibri]reflect_blue_magic     0           set to 1 for this mob to also reflect blue magic cast on it

https://ffxiclopedia.fandom.com/wiki/Colibri
https://ffxiclopedia.fandom.com/wiki/Greater_Colibri
https://ffxiclopedia.fandom.com/wiki/Chamrosh
--]]

require("scripts/globals/mixins")
require("scripts/globals/magic")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.colibri_mimic = function(mob)

    mob:addListener("MAGIC_TAKE", "COLIBRI_MIMIC_MAGIC_TAKE", function(caster, target, spell)
        if
            target:AnimationSub() == 0 and
            spell:tookEffect() and
            (caster:isPC() or caster:isPet()) and
            (spell:getSpellGroup() ~= dsp.magic.spellGroup.BLUE or target:getLocalVar("[colibri]reflect_blue_magic") == 1)
        then
            target:setLocalVar("[colibri]spellToMimic", spell:getID()) -- which spell to mimic
            target:setLocalVar("[colibri]castWindow", os.time() + 30) -- after thirty seconds, will stop attempting to mimic
            target:setLocalVar("[colibri]castTime", os.time() + 6) -- enforce a delay between original spell, and mimic spell.
            target:AnimationSub(1)
        end
    end)

    mob:addListener("COMBAT_TICK", "COLIBRI_MIMIC_CTICK", function(mob)
        local spellToMimic = mob:getLocalVar("[colibri]spellToMimic")
        local castWindow = mob:getLocalVar("[colibri]castWindow")
        local castTime = mob:getLocalVar("[colibri]castTime")
        local osTime = os.time()

        if mob:AnimationSub() == 1 then
            if spellToMimic > 0 and osTime > castTime and castWindow > osTime and not mob:hasStatusEffect(dsp.effect.SILENCE) then
                mob:castSpell(spellToMimic)
                mob:setLocalVar("[colibri]spellToMimic", 0)
                mob:setLocalVar("[colibri]castWindow", 0)
                mob:setLocalVar("[colibri]castTime", 0)
                mob:AnimationSub(0)
            elseif spellToMimic == 0 or osTime > castWindow then
                mob:setLocalVar("[colibri]spellToMimic", 0)
                mob:setLocalVar("[colibri]castWindow", 0)
                mob:setLocalVar("[colibri]castTime", 0)
                mob:AnimationSub(0)
            end
        end
    end)

    mob:addListener("DISENGAGE", "COLIBRI_MIMIC_DISENGAGE", function(mob)
        mob:setLocalVar("[colibri]spellToMimic", 0)
        mob:setLocalVar("[colibri]castWindow", 0)
        mob:setLocalVar("[colibri]castTime", 0)
        if mob:AnimationSub() == 1 then
            mob:AnimationSub(0)
        end
    end)

end

return g_mixins.families.colibri_mimic
