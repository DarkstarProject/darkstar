-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Ancient Weapon
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs");
require("scripts/globals/fieldsofvalor");

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,102,2);
    if (isKiller and GetMobByID(ID.mob.LEGENDARY_WEAPON):isDead()) then
        GetNPCByID(ID.npc.BEHEMOTHS_CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
