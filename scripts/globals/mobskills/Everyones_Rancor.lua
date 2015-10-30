---------------------------------------------
--  Everyones Grudge
--
--  Notes: Invokes collective hatred to spite a single target.
--   Damage done is 5x the amount of tonberries you have killed! For NM's using this it is 50 x damage.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS) and mob:getHP()/mob:getMaxHP() <= 0.25) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local realDmg = 0;
    local mobID = mob:getID();

    if (target:getID() > 100000) then
        realDmg = 10 * math.random(50,100);
    else
        realDmg = 10 * target:getVar("EVERYONES_GRUDGE_KILLS"); -- Damage is 5 times the amount you have killed

        if (mobID == 17428677 or mobID == 17433008 or mobID == 17433006 or mobID == 17433009 or mobID == 17432994 or mobID == 17433007 or mobID == 17428813 or mobID == 17432659 or mobID == 17432846 or mobID == 17428809) then
            realDmg = realDmg * 10;  -- Sets the Multiplyer to 50 for NM's
        elseif (mobID == 17432799 or mobID == 17428611 or MobID == 17428554 or mobID == 17428751 or mobID == 17432609 or mobID == 16814432 or mobID == 17432624 or mobID == 17285526 or mobID == 17285460) then
            realDmg = realDmg * 10;   -- Sets the Multiplyer to 50 for NM's , staggered list
        end
    end

    target:delHP(realDmg);

    return realDmg;

end;