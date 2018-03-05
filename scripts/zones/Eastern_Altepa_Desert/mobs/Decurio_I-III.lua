-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Decurio I-III
-- Involved in Quest: A Craftsman's Work
-- !pos X:113 Y:-7 Z:-72 (106)
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getVar("aCraftsmanWork") == 1) then
        player:setVar("Decurio_I_IIIKilled",1);
    end

end;