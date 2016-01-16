-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Ubume
-- Involved in Quest: Yomi Okuri
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getQuestStatus(OUTLANDS,YOMI_OKURI) == QUEST_ACCEPTED and ally:getVar("yomiOkuriCS") <= 3) then
        ally:setVar("yomiOkuriKilledNM",1);
    end

end;