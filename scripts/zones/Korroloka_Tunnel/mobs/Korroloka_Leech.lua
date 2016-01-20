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

function onMobDeath(mob, killer, ally)

    if (ally:getVar("AyameAndKaede_Event") == 2) then
        local leeches = ally:getVar("KorrolokaLeeches");

        ally:setVar("KorrolokaLeeches",leeches+1);
        ally:setVar("KorrolokaLeeches_Timer",os.time());
    end

end;



