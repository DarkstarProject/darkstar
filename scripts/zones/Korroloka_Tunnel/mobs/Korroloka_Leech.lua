-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Korroloka Leech
--  Involved in Quest: Ayame and Kaede
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getVar("AyameAndKaede_Event") == 2) then
        local leeches = player:getVar("KorrolokaLeeches");

        player:setVar("KorrolokaLeeches",leeches+1);
        player:setVar("KorrolokaLeeches_Timer",os.time());
    end

end;



