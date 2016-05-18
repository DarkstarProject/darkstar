-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder_Euphrosyne
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 1) then
        player:setVar("Warder_Euphrosyne_KILL",1);
    end
end;