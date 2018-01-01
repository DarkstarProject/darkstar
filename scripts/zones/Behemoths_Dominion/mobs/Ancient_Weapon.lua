-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Ancient Weapon
-----------------------------------
require("scripts/zones/Behemoths_Dominion/MobIDs");
require("scripts/globals/fieldsofvalor");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,102,2);
    if (isKiller and GetMobByID(LEGENDARY_WEAPON):isDead()) then
        GetNPCByID(CERMET_HEADSTONE_DOMINION):setLocalVar("cooldown", os.time() + 900);
    end
end;
