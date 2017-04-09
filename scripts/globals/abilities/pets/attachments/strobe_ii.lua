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
    pet:addMod(MOD_ENMITY, 10) -- 20 currently on retail
    pet:addMod(MOD_AUTO_PROVOKE, 1)
end

function onUnequip(pet)
    pet:delMod(MOD_ENMITY, 10) -- 20 currently on retail
    pet:delMod(MOD_AUTO_PROVOKE, 1)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_ENMITY, 15); -- 20 currently on retail
    elseif (maneuvers == 2) then
        pet:addMod(MOD_ENMITY, 15); -- 25 currently on retail
    elseif (maneuvers == 3) then
        pet:addMod(MOD_ENMITY, 20); -- 35 currently on retail
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_ENMITY, 15); -- 20 currently on retail
    elseif (maneuvers == 2) then
        pet:delMod(MOD_ENMITY, 15); -- 25 currently on retail
    elseif (maneuvers == 3) then
        pet:delMod(MOD_ENMITY, 20); -- 35 currently on retail
    end
end
