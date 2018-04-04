---------------------------------------------
-- Flashbulb
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 45)
	local highest = automaton:getSkillLevel(22)
	local highestskill = 22
	if automaton:getSkillLevel(23) > highest then
		highestskill = 23
		highest = automaton:getSkillLevel(23)
	end
	if automaton:getSkillLevel(24) > highest then
		highestskill = 24
	end

    local resist = applyResistanceAbility(automaton, target, 7, highestskill, 150)
    local duration = 12 * resist

    if resist > 0.0625 then
        if target:addStatusEffect(dsp.effects.FLASH, 200, 0, duration) then
            skill:setMsg(msgBasic.SKILL_ENFEEB)
        else
            skill:setMsg(msgBasic.SKILL_NO_EFFECT)
        end
    else
        skill:setMsg(msgBasic.RESIST)
    end

    return dsp.effects.FLASH
end
