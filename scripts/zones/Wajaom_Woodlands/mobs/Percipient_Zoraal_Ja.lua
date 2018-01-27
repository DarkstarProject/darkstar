-----------------------------------
-- Area: Wajaom Woodlands
--  MOB: Percipient Zoraal Ja
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/MobIDs");

function onMobDeath(mob, player, isKiller)
    -- make pkuucha killable
    local pet = GetMobByID(ZORAAL_JA_S_PKUUCHA);
    if (pet ~= nil) then
        pet:setUnkillable(false);
        if (pet:getHPP() <= 1) then
            pet:setHP(0);
        end
    end;
end;

function onMobDespawn(mob)
end;
