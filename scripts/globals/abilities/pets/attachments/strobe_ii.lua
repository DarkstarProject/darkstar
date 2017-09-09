-----------------------------------
-- Attachment: Strobe II
-- http://forum.square-enix.com/ffxi/threads/49065?p=565264#post565264
-- Values are currently PRIOR TO NOVEMBER 2015 UPDATE!
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_ENMITY, 20)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_STROBE_II", function(automaton, target)
        if automaton:getLocalVar("provoke") < VanadielTime() and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(1945)
        else
            return 0
        end
    end)
end

function onUnequip(pet)
    pet:delMod(MOD_ENMITY, 20)
    pet:removeListener("ATTACHMENT_STROBE_II")
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_ENMITY, 20);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_ENMITY, 25);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_ENMITY, 35);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_ENMITY, 20);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_ENMITY, 25);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_ENMITY, 35);
    end
end
