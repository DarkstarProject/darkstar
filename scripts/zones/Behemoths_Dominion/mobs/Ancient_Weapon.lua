-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Ancient Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE and player:hasKeyItem(LIGHTNING_FRAGMENT) == false) then
        if (GetServerVariable("[ZM4]Lightning_Headstone_Active") == 0) then
            SetServerVariable("[ZM4]Lightning_Headstone_Active",1);
        elseif (GetServerVariable("[ZM4]Lightning_Headstone_Active") == 1) then
            SetServerVariable("[ZM4]Lightning_Headstone_Active",os.time()+ 900);
        end
    else
        checkRegime(player,mob,102,2);
    end

end;
