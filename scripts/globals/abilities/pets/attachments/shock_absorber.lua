-----------------------------------
-- Attachment: Shock Absorber
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onManeuverGain(player,maneuvers)
    if (maneuvers == 2) then
        --player:getPet():useAbility();
    end
end

function onManeuverLose(player,maneuvers)

end
