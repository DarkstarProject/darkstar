-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Lich_C_Magnus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:addTitle(LICH_BANISHER);
    if (ally:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
        ally:setVar("Lich_C_Magnus_Died",1);
    end
end;