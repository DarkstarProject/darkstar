-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Ancient Weapon
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs");
require("scripts/globals/regimes")

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120);
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 102, 2, dsp.regime.type.FIELDS)
    if (isKiller and GetMobByID(ID.mob.LEGENDARY_WEAPON):isDead()) then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900);
    end
end;
