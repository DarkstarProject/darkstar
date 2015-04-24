-----------------------------------
-- Attachment: Heat Sink
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onManeuverGain(player,maneuvers)
    -- PROOF OF CONCEPT
    --[[if (maneuvers == 1) then
        player:addPetMod(MOD_BURDEN_DECAY, 2);
    elseif (maneuvers == 2) then
        player:addPetMod(MOD_BURDEN_DECAY, 3); 
    elseif (maneuvers == 3) then
        player:addPetMod(MOD_BURDEN_DECAY, 2);
    end]]
end

function onManeuverLose(player,maneuvers)
    --[[if (maneuvers == 1) then
        player:delPetMod(MOD_BURDEN_DECAY, 2);
    elseif (maneuvers == 2) then
        player:delPetMod(MOD_BURDEN_DECAY, 3); 
    elseif (maneuvers == 3) then
        player:delPetMod(MOD_BURDEN_DECAY, 2);
    end]]
end
