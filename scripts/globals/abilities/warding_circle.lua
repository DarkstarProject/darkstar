-----------------------------------
-- Ability: Warding Circle
-- Grants resistance, defense, and attack against Demons to party members within the area of effect.
-- Obtained: Samurai Level 5
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local power = 5;			--when cast as Subjob
    local duration = 180;

    if (player:getMainJob() == JOBS.SAM) then
        local sHead = player:getEquipID(SLOT_HEAD);

        if (sHead == 13868 or sHead == 15236 or sHead == 27674 or sHead = 27695) then
            power = 17;			--when cast as Mainjob w/ equipment
            duration = 240;		--Kabutos increase duration by 50%
        else
            power = 15;			--when cast as Mainjob w/o equipment
        end
    end    

    target:addStatusEffect(EFFECT_WARDING_CIRCLE,power,0,duration);
end;