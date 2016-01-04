-----------------------------------
-- Area: Jugner Forest [S]
--  NM:  Fingerfilcher Dradzad
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");


-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        ally:needToZone(true);
        ally:setVar("FingerfilcherKilled",1);
    end
end;